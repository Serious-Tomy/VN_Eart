using System.Collections;
using System.Collections.Generic;
using Unity.VisualScripting;
using UnityEngine;

public class DetecteurDisque : MonoBehaviour
{
    bool Detecteur;
    // Start is called before the first frame update
    void Start()
    {

    }

    // Update is called once per frame
    void Update()
    {

    }

    private void OnTriggerStay(Collider col)
    {

        if (col.CompareTag("Collision") && !Input.GetMouseButton(0))
        {
            Detecteur = true;
            Debug.Log("dedans");
        }
    }

    private void OnTriggerExit(Collider col)
    {
        Detecteur = false;
        Debug.Log("dehors");
    }
}
