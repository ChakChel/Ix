/**
 * @file    ft.h
 * @brief   Header des fonctions de l'algorithme du R�gulateur RST
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
 * @brief   Cette fonction doit �tre appel�e une fois en d�but de programme afin
 *          d'initialiser les vecteurs de stockage et composante continue du 
 *          r�gulateur
 * @param   yinit   valeur initiale de la mesure
 * @param   uinit   valeur initiale de la commande
 * @param   cinit   valeur initiale de la consigne
 */
void init_stockage ( float yinit, float uinit, float cinit);

/**
 * @fn      float execute_rst (short unsigned int consigne, short unsigned int mesure)
 * @brief   Cette fonction doit �tre appel�e � chaque p�riode d'�chantillonnage
 *          Te
 * @param   consigne    consigne � l'instant t
 * @param   mesure      sortie du proc�d� � l'instant t
 * @return   commande � appliquer � l'instant t
 */
float execute_rst (short unsigned int consigne, short unsigned int mesure);

/**
 * Dans le cas o� il est n�cessaire de minimiser le temps entre l'acquisition de
 * la mesure et l'envoi de la commande, on peut utiliser la d�composition en 3
 * fonctions pr�sent�e ci-dessous:
 */

/**
 * @fn     void precalcul_rst (void)
 * @brief   appel�e � chaque p�riode d'�chantillonnage
 */
void precalcul_rst (void);

/**
 * @fn      float execalcul_rst (float consigne, float mesure)
 * @brief   
 * @param   consigne    consigne � l'instant t
 * @param   mesure      sortie du proc�d� � l'instant t
 * @return   commande � appliquer � l'instant t
 */
float execalcul_rst (float consigne, float mesure);

/**
 * @fn      void postcalcul_rst(float commande)
 * @brief   appel�e � chaque p�riode d'�chantillonnage,
 *          apr�s l'envoi de la commande
 * @param   commande    commande � appliquer � l'instant t
 */
void postcalcul_rst(float commande);

/** A chaque p�riode d'�chantillonage Te, on doit donc r�aliser l'encha�nement
 *  pr�sent� ci-apr�s :
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
 * @brief   utilis�e par la fonction execalcul_rst
 * @param
 * @return  
 */
float calc_ref (float nvcons);

/**
 * @fn      float calc_cmde (float yref, float mesure)
 * @brief   utilis�e par la fonction execalcul_rst
 * @param
 * @return
 */
float calc_cmde (float yref, float mesure);

/**
 * @fn      void decal_trajref (float consigne, float yref)
 * @brief   utilis�e par la fonction postcalcul_rst
 * @param
 * @return
 */
void decal_trajref (float consigne, float yref);

/**
 * @fn      void decal_obser(float yref, float mesure, float commande)
 * @brief   utilis�e par la fonction postcalcul_rst
 * @param
 * @return
 */
void decal_obser(float yref, float mesure, float commande);


#endif // _FT_