using System.Collections;
using System.Collections.Generic;
using Unity.VisualScripting;
using UnityEngine;

public class DetecteurDisque : Puzzle
{
    [SerializeField] int nombreDisque;
    private int totalDisque;
    bool Detecteur;
    // Start is called before the first frame update
    void Start()
    {
        Debug.Log("nombre de disque" + nombreDisque);
    }

    // Update is called once per frame
    void Update()
    {

    }

    //private void OnTriggerStay(Collider col)
    //{

    //    if (col.CompareTag("Collision") && !Input.GetMouseButton(0))
    //    {
    //        Detecteur = true;
    //        Debug.Log("dedans");
    //    }
    //}

    private void OnTriggerEnter(Collider other)
    {

        if (other.CompareTag("Collision"))
        {
            totalDisque += 1;
            Debug.Log(totalDisque);
        }
    }


    private void OnTriggerExit(Collider other)
    {

        if (other.CompareTag("Collision"))
        {
            totalDisque -= 1;
            Debug.Log(totalDisque);
        }
    }

    public void CheckDisque()
    {
        Debug.Log(nombreDisque + " " + totalDisque);
        if (totalDisque == nombreDisque)
        {
            Debug.Log("if passé");
            IsValide = true;
            Debug.Log("IsValide Passé");
            Validate();
            Debug.Log("terminé");
        }
        
    }
}
