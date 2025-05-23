using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using TMPro;
using Unity.VisualScripting;
using UnityEngine;

public class GameManager : MonoBehaviour
{
    [SerializeField] private GameObject lautotomatePrefab;
    [SerializeField] private GameObject joueurPrefab;
    [SerializeField] private Joueur joueur;
    [SerializeField] private GameObject prefabCase;
    [SerializeField] private float tailleCase = 1;
    [SerializeField] private Transform positionDaparition;
    [SerializeField] private float speed;
    //[SerializeField] private float compteurAutomate = 10f;
    //[SerializeField] private float compteurJoueur = 10f;
    private Automate automate;
    private bool tourJoueur = true;
    private GameObject[,] grilleDeJeu;
    private float tempsAutomate = 0.0f;
    private float tempsJoueur = 0.0f;
    public int longeur = 5;
    public int largeur = 5;



    // Start is called before the first frame update
    void Start()
    {
        grilleDeJeu = new GameObject[longeur, largeur];
        for (int i = 0; i < longeur; i++)
        {
            for (int j = 0; j < largeur; j++)
            {
                Vector3 positionDepart = positionDaparition.position + new Vector3(i * tailleCase, -(j * tailleCase), 0);
                GameObject casePuzzle = Instantiate(prefabCase, positionDepart, Quaternion.identity);
                casePuzzle.GetComponent<Case>().gameManager = this;
                grilleDeJeu[i, j] = casePuzzle;
            }
        }

        Vector3 positionAutomate = grilleDeJeu[0, 2].transform.position;
        Vector3 positionJoueur = grilleDeJeu[7, 2].transform.position;

        automate = Instantiate(lautotomatePrefab, positionAutomate, Quaternion.Euler(new Vector3(-90, 0, 0)), this.transform.parent).GetComponent<Automate>();
        automate.currentGrid = grilleDeJeu[0, 2];
        joueur = Instantiate(joueurPrefab, positionJoueur, Quaternion.Euler(new Vector3(-90, 0, 0)), this.transform.parent).GetComponent<Joueur>();
        joueur.currentGrid = grilleDeJeu[7, 2];
    }

    // Update is called once per frame
    void Update()
    {
        if (automate.lastGrid != null && tempsAutomate < 1.0f)
        {
            tempsAutomate += Time.deltaTime * speed;
            automate.transform.position = Vector3.Lerp(automate.lastGrid.transform.position, automate.currentGrid.transform.position, tempsAutomate);  
        }

        if (joueur.lastGrid != null && tempsJoueur < 1.0f)
        {
            tempsJoueur += Time.deltaTime * speed;
            joueur.transform.position = Vector3.Lerp(joueur.lastGrid.transform.position, joueur.currentGrid.transform.position, tempsJoueur);
        }

        if (tourJoueur == false && tempsJoueur >= 1.0f)
        {
            CheckLoose();
            DeplacementTotomate();
            tempsAutomate = 0.0f;
            tourJoueur = true;
        }

        if (tourJoueur == true && tempsAutomate >= 1.0f)
        {
            CheckLoose();
        }


    }

    private void DeplacementTotomate()
    {

            List<GameObject> casePosition = new List<GameObject>();

            GameObject currentGrid = automate.currentGrid;

            //haut
            {
                if (Physics.Raycast(currentGrid.transform.position, Vector3.up, out RaycastHit hit, 30f) && hit.collider.tag == "Case")
                {
                    casePosition.Add(hit.collider.gameObject);
                }
            }
            //gauche
            {
                if (Physics.Raycast(currentGrid.transform.position, Vector3.left, out RaycastHit hit, 30f) && hit.collider.tag == "Case")
                {
                    casePosition.Add(hit.collider.gameObject);
                }
            }
            //droite
            {
                if (Physics.Raycast(currentGrid.transform.position, Vector3.right, out RaycastHit hit, 30f) && hit.collider.tag == "Case")
                {
                    casePosition.Add(hit.collider.gameObject);
                }
            }
            //bas
            {
                if (Physics.Raycast(currentGrid.transform.position, Vector3.down, out RaycastHit hit, 30f) && hit.collider.tag == "Case")
                {
                    casePosition.Add(hit.collider.gameObject);
                }
            }

            if (casePosition.Count == 0)
            {
                Debug.Log("aucune case disponible, bloqué");
            }
            else
            {
                if (casePosition.Count > 1)
                {
                    casePosition.Remove(automate.lastGrid);
                }

                GameObject choosenGrid = casePosition.ElementAt(UnityEngine.Random.Range(0, casePosition.Count()));
                automate.lastGrid = currentGrid;
                automate.currentGrid = choosenGrid;


            }
        }


    public void DeplacementJoueur(Case cacase)
    {
        if (tourJoueur == false)
        {
            return;
        }

            List<GameObject> casePosition = new List<GameObject>();
            GameObject currentGrid = joueur.currentGrid;

            {
                if (Physics.Raycast(currentGrid.transform.position, Vector3.up, out RaycastHit hit, 30f) && hit.collider.tag == "Case")
                {
                    casePosition.Add(hit.collider.gameObject);
                }
            }
            //gauche
            {
                if (Physics.Raycast(currentGrid.transform.position, Vector3.left, out RaycastHit hit, 30f) && hit.collider.tag == "Case")
                {
                    casePosition.Add(hit.collider.gameObject);
                }
            }
            //droite
            {
                if (Physics.Raycast(currentGrid.transform.position, Vector3.right, out RaycastHit hit, 30f) && hit.collider.tag == "Case")
                {
                    casePosition.Add(hit.collider.gameObject);
                }
            }
            //bas
            {
                if (Physics.Raycast(currentGrid.transform.position, Vector3.down, out RaycastHit hit, 30f) && hit.collider.tag == "Case")
                {
                    casePosition.Add(hit.collider.gameObject);
                }
            }

            if (casePosition.Contains(cacase.gameObject))
            {
                tempsJoueur = 0f;
                joueur.lastGrid = currentGrid.gameObject;
                joueur.currentGrid = cacase.gameObject;
                tourJoueur = false;


        }
    }

    private void CheckLoose()
    {
        if ( automate.currentGrid == joueur.currentGrid)
        {
            joueur.transform.position = grilleDeJeu[7, 2].transform.position;
            joueur.currentGrid = grilleDeJeu[7, 2];
            automate.transform.position = grilleDeJeu[0, 2].transform.position;
            automate.currentGrid = grilleDeJeu[0, 2];
        }
    }
}
