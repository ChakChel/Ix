/**
 * @file    ft.h
 * @brief   Header des fonctions de l'algorithme du Régulateur RST
 * IDE MPLAB X vs Beta 7.02
 * Compilateur XC32 vs 2.0
 * @author  Ixchel Intelligent Systems
 * @version 1.0
 * @date    03/11/13
 */

#ifndef _FT_
#define _FT_


/* INCLUDE FILES ***************/
#include <stdio.h>


/* FUNCTION PROTOTYPES ***************/

/**
 * @fn      void init_stockage ( float yinit, float uinit, float cinit )
 * @brief   Cette fonction doit être appelée une fois en début de programme afin
 *          d'initialiser les vecteurs de stockage et composante continue du 
 *          régulateur
 * @param   yinit   valeur initiale de la mesure
 * @param   uinit   valeur initiale de la commande
 * @param   cinit   valeur initiale de la consigne
 */
void init_stockage ( float yinit, float uinit, float cinit);

/**
 * @fn      float execute_rst (short unsigned int consigne, short unsigned int mesure)
 * @brief   Cette fonction doit être appelée à chaque période d'échantillonnage
 *          Te
 * @param   consigne    consigne à l'instant t
 * @param   mesure      sortie du procédé à l'instant t
 * @return   commande à appliquer à l'instant t
 */
float execute_rst (short unsigned int consigne, short unsigned int mesure);

/**
 * Dans le cas où il est nécessaire de minimiser le temps entre l'acquisition de
 * la mesure et l'envoi de la commande, on peut utiliser la décomposition en 3
 * fonctions présentée ci-dessous:
 */

/**
 * @fn     void precalcul_rst (void)
 * @brief   appelée à chaque période d'échantillonnage
 */
void precalcul_rst (void);

/**
 * @fn      float execalcul_rst (float consigne, float mesure)
 * @brief   
 * @param   consigne    consigne à l'instant t
 * @param   mesure      sortie du procédé à l'instant t
 * @return   commande à appliquer à l'instant t
 */
float execalcul_rst (float consigne, float mesure);

/**
 * @fn      void postcalcul_rst(float commande)
 * @brief   appelée à chaque période d'échantillonnage,
 *          après l'envoi de la commande
 * @param   commande    commande à appliquer à l'instant t
 */
void postcalcul_rst(float commande);

/** A chaque période d'échantillonage Te, on doit donc réaliser l'enchaînement
 *  présenté ci-après :
 *
 * ...
 * precalcul_rst();
 * ... Acquisition de la mesure (et calcul de la consigne)
 * execalcul_rst(consigne, mesure);
 * ... Envoi de la commande
 * postcalcul_rst(commande);
 * ...
 */

/**
 * @fn      float calc_ref (float nvcons)
 * @brief   utilisée par la fonction execalcul_rst
 * @param
 * @return  
 */
float calc_ref (float nvcons);

/**
 * @fn      float calc_cmde (float yref, float mesure)
 * @brief   utilisée par la fonction execalcul_rst
 * @param
 * @return
 */
float calc_cmde (float yref, float mesure);

/**
 * @fn      void decal_trajref (float consigne, float yref)
 * @brief   utilisée par la fonction postcalcul_rst
 * @param
 * @return
 */
void decal_trajref (float consigne, float yref);

/**
 * @fn      void decal_obser(float yref, float mesure, float commande)
 * @brief   utilisée par la fonction postcalcul_rst
 * @param
 * @return
 */
void decal_obser(float yref, float mesure, float commande);


#endif // _FT_