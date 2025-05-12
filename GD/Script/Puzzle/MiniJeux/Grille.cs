using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Grille : MonoBehaviour
{

    [SerializeField] private int longeur = 5;
    [SerializeField] private int largeur = 5;
    [SerializeField] private GameObject prefabCase;
    [SerializeField] private float tailleCase = 1;

    // Start is called before the first frame update
    void Start()
    {
        for (int x = 0; x < longeur; x++)
        {
            for(int y = 0; y < largeur; y++)
            {
                Vector3 position = new Vector3(x * tailleCase, y * tailleCase, 0);
                Instantiate(prefabCase, position, Quaternion.identity);
            }
        }
    }

    // Update is called once per frame
    void Update()
    {
        
    }
}
