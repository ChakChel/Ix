/**
 * @file    ft.c
 * @brief   Algorithme du Régulateur RST
 *          Equations de base: yrt = Bm(q-1)*ur(t) - Am(q-1)*yrt(t-1)
 *          S(q-1)*u(t) = T(q-1 )*yr(t) - R(q-1)*y(t)
 * IDE MPLAB X vs Beta 7.02
 * Compilateur XC32 vs 2.0
 * @author  Ixchel Intelligent Systems
 * @version 1.0
 * @date    03/11/13
 */

/* INCLUDE FILES ***************/
#include "ft.h"

/* MACROS AND GLOBALS ***************/
#define Rdeg 4
float R[Rdeg+1] = {-0.1026, 0.3352,-0.3854,0.1767,-0.0238};
#define Sdeg 4
float S[Sdeg+1] = {1.0,-3.0838,3.3476,-1.4389,0.1751};
#define Tdeg 3
float T[Tdeg+1] = {0.8712*1.0e-3, -1.5249*1.0e-3, 0.8767*1.0e-3, -0.1493*1.0e-3};
#define Amdeg 0
float Am[Amdeg+1] = {1};
#define Bmdeg 0
float Bm[Bmdeg+1] = {1};

// Vecteurs utilisés pour le stockage des signaux :
// L'indice i correspond au temps t-i, t étant l'instant actuel
// par exemple, ut[1] représente u(t-1), yt[3] représente y(t-3)

float yt[Rdeg+1], ut[Sdeg+1], yreft[Tdeg+1];
float yrt[Amdeg+1], urt[Bmdeg+1];
float compo_continu; 	// Composante continue du régulateur
float prepa_cmde;		// Valeur intermédiaire pour le calcul


/* FUNCTIONS ***************/

/**
 * @fn      void init_stockage ( float yinit, float uinit, float cinit )
 * @brief   Cette fonction doit être appelée une fois en début de programme afin
 *          d'initialiser les vecteurs de stockage et composante continue du
 *          régulateur
 * @param   yinit   valeur initiale de la mesure
 * @param   uinit   valeur initiale de la commande
 * @param   cinit   valeur initiale de la consigne
 */
void init_stockage( float yinit, float uinit, float cinit ) {

    int j;
    float sigmaR, sigmaT, sigmaS;

    sigmaR = 0.;

    for(j = 0; j <= Rdeg; j++) {
        yt[j] = yinit;
        sigmaR += R[j];
    }
    sigmaS = 0.;
    for (j = 0; j <= Sdeg; j++) {
        ut[j] = uinit;
        sigmaS += S[j];
    }
    sigmaT = 0.;
    for (j = 0; j <= Tdeg; j++) {
        yreft[j] = cinit;
        sigmaT += T[j];
    }
    // Calcul de la composante continue à prendre en compte dans la sommation,
    // avant la division par S0:
    compo_continu = (sigmaR-sigmaT) * yinit + sigmaS * uinit;
}

/**
 * @fn      float execute_rst (short unsigned int consigne, short unsigned int mesure)
 * @brief   Cette fonction doit être appelée à chaque période d'échantillonnage
 *          Te
 * @param   consigne    consigne à l'instant t
 * @param   mesure      sortie du procédé à l'instant t
 * @return   commande à appliquer à l'instant t
 */
float execute_rst( short unsigned int consigne, short unsigned int mesure ) {

    float commande;
    float yref; // Sortie du modèle de référence de poursuite

    precalcul_rst();
    yref = calc_ref(consigne);
    commande = calc_cmde(yref, mesure);
    decal_trajref(consigne, yref);
    decal_obser(yref, mesure, commande);
    
    return commande;
}

// ========== VARIANTE en 3 PHASES optimisant les temps de traitement ==========
//  - précalcul_rst
//  - execalcul_rst => /calc_ref /calc_cmde
//  - poscalcul_rst => /decal_trajref /decal_obser
// =============================================================================

/**
 * @fn     void precalcul_rst (void)
 * @brief  appelée à chaque période d'échantillonnage
 */
void precalcul_rst( void ) {

    float somme;
    int j;

    somme = compo_continu;
    for(j = 1; j <= Tdeg; j++) {
        somme += T[j]*yreft[j];
    }
    for(j = 1; j <= Rdeg; j++) {
        somme -= R[j]*yt[j];
    }
    for(j = 1; j <= Sdeg; j++) {
        somme -= S[j]*ut[j];
    }
    
    prepa_cmde = somme;

    return;
}


/**
 * @fn      float execalcul_rst (float consigne, float mesure)
 * @brief   appelée à chaque période d'échantillonnage
 *          après l'acquisition des mesures et avant l'envoi de la commande
 * @param   consigne    consigne à l'instant t
 * @param   mesure      sortie du procédé à l'instant t
 * @return   commande à appliquer à l'instant t
 */
float execalcul_rst( float consigne, float mesure ) {
    
    float commande;

    yt[0] = mesure;
    urt[0] = consigne;
    yreft[0] = calc_ref(consigne);
    commande = calc_cmde(yreft[0], mesure);

    return commande;
}

/**
 * @fn      float calc_ref (float nvcons)
 * @brief   utilisée par la fonction execalcul_rst
 * @param   
 * @return
 */
float calc_ref( float nvcons ) {

    // Calcul de la sortie du modèle de référence, selon :
    // yrt = Bm . urt - Am* yrt(t-1)
    // ATTENTION : la valeur calculée n'est pas stockée dans yrt[0]
    int j;
    float somme;

    somme = Bm[0] * nvcons;

    for(j = 1; j <= Bmdeg; j++) {
        somme += Bm[j] * urt[j];
    }
    for(j = 1; j <= Amdeg; j++) {
        somme -= Am[j] * yrt[j];
    }

    return(somme);
}

/**
 * @fn      float calc_cmde (float yref, float mesure)
 * @brief   utilisée par la fonction execalcul_rst
 * @param
 * @return
 */
float calc_cmde( float yref, float mesure ) {
    
    float somme;

    somme = prepa_cmde;
    somme -= R[0]*mesure;
    somme += T[0]*yref;
    somme = somme / S[0];

    return somme;
}

/**
 * @fn      void postcalcul_rst(float commande)
 * @brief   appelée à chaque période d'échantillonnage,
 *          après l'envoi de la commande
 * @param   commande    commande à appliquer à l'instant t
 */
void postcalcul_rst( float commande ) {
    
    decal_trajref(urt[0], yreft[0]);
    decal_obser(yreft[0], yt[0], commande);

    return;
}

/**
 * @fn      void decal_trajref (float consigne, float yref)
 * @brief   utilisée par la fonction postcalcul_rst
 * @param
 * @return
 */
void decal_trajref( float consigne, float yref ) {
    
    int j;

    for(j = Bmdeg; j > 1; j--) {
        urt[j] = urt[j-1];
    }
    for(j = Amdeg; j > 1; j--) {
        yrt[j] = yrt[j-1];
    }

    urt[1] = consigne;
    yrt[1] = yref;
}

/**
 * @fn      void decal_obser(float yref, float mesure, float commande)
 * @brief   utilisée par la fonction postcalcul_rst
 * @param
 * @return
 */
void decal_obser( float yref, float mesure, float commande ) {
    
    int j;

    for(j = Rdeg; j > 1; j--) {
        yt[j] = yt[j-1];
    }
    for(j = Sdeg; j > 1; j--) {
        ut[j] = ut[j-1];
    }
    for(j = Tdeg; j > 1; j--) {
        yreft[j] = yreft[j-1];
    }
    
    yt[1] = mesure;
    ut[1] = commande;
    yreft[1] = yref;
}