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
        }
    }


    private void OnTriggerExit(Collider other)
    {
        Debug.Log("detecté");
        if (other.CompareTag("Collision"))
        {
            totalDisque -= 1;
        }
    }

    public void CheckDisque()
    {
        if (totalDisque != nombreDisque || !enabled)
        {
            return;
        }

        IsValide = true;
        Validate();
    }
}
