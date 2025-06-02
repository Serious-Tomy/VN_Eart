using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using TMPro;
using Unity.VisualScripting;
using UnityEngine;

public class GameManager : Puzzle
{
    [SerializeField] private GameObject lautotomatePrefab;
    [SerializeField] private GameObject joueurPrefab;
    [SerializeField] private Joueur joueur;
    [SerializeField] private GameObject prefabCase;
    [SerializeField] private GameObject End;
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
    public bool win = false;



    // Start is called before the first frame update
    void Start()
    {
        grilleDeJeu = new GameObject[longeur, largeur];
        for (int i = 0; i < longeur; i++)
        {
            for (int j = 0; j < largeur; j++)
            {
                Vector3 positionDepart = positionDaparition.position + new Vector3(i * tailleCase, -(j * tailleCase), 0);
                GameObject casePuzzle = Instantiate(prefabCase, positionDepart, Quaternion.Euler(new Vector3(90, 0, 0)));
                casePuzzle.GetComponent<Case>().gameManager = this;
                grilleDeJeu[i, j] = casePuzzle;
            }
        }

        Vector3 positionAutomate = grilleDeJeu[6, 2].transform.position + new Vector3(0, 0, 0.1f);
        Vector3 positionJoueur = grilleDeJeu[0, 2].transform.position + new Vector3(0, 0, 0.1f);

        automate = Instantiate(lautotomatePrefab, positionAutomate, Quaternion.Euler(new Vector3(-90, 0, 0)), this.transform.parent).GetComponent<Automate>();
        automate.currentGrid = grilleDeJeu[6, 2];
        joueur = Instantiate(joueurPrefab, positionJoueur, Quaternion.Euler(new Vector3(-90, 0, 0)), this.transform.parent).GetComponent<Joueur>();
        joueur.currentGrid = grilleDeJeu[0, 2];
    }

    // Update is called once per frame
    void Update()
    {
        CheckWin();
        if (automate.lastGrid != null && tempsAutomate < 1.0f)
        {
            tempsAutomate += Time.deltaTime * speed;
            automate.transform.position = Vector3.Lerp(automate.lastGrid.transform.position + new Vector3(0, 0, 0.1f), automate.currentGrid.transform.position + new Vector3(0, 0, 0.1f), tempsAutomate);  
        }

        if (joueur.lastGrid != null && tempsJoueur < 1.0f)
        {
            tempsJoueur += Time.deltaTime * speed;
            joueur.transform.position = Vector3.Lerp(joueur.lastGrid.transform.position + new Vector3(0, 0, 0.1f), joueur.currentGrid.transform.position + new Vector3(0, 0, 0.1f), tempsJoueur);
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
        Debug.Log("1");
        if (tourJoueur == false)
        {
            return;
        }

        Debug.Log("2");
            List<GameObject> casePosition = new List<GameObject>();
            GameObject currentGrid = joueur.currentGrid;

            {
                if (Physics.Raycast(currentGrid.transform.position, Vector3.up, out RaycastHit hit, 30f) && hit.collider.tag == "Case")
                {
                Debug.Log(hit);
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
        Debug.Log(casePosition.Count);
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
            joueur.transform.position = grilleDeJeu[0, 2].transform.position + new Vector3(0, 0, 0.1f);
            joueur.currentGrid = grilleDeJeu[0, 2];
            automate.transform.position = grilleDeJeu[6, 2].transform.position + new Vector3(0, 0, 0.1f);
            automate.currentGrid = grilleDeJeu[6, 2];
        }
    }

    private void CheckWin()
    {
        if (joueur.currentGrid != grilleDeJeu[6, 2])
        {
            win = false;
            return;
        }

        if (joueur.currentGrid == grilleDeJeu[6, 2] && win == true)
        {
            Validate();
            tempsJoueur += Time.deltaTime * speed;
            joueur.transform.position = Vector3.Lerp(joueur.currentGrid.transform.position, End.transform.position, tempsJoueur);
            Debug.Log("Jeu gagné");
            gameObject.SetActive(false);
        }
    }
}
