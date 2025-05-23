using System.Collections;
using System.Collections.Generic;
using Unity.VisualScripting;
using UnityEngine;

public class Deplacement : MonoBehaviour
{
    
    [SerializeField] private Transform departs;
    [SerializeField] private Vector3 arriver = new Vector3(5,0,0);
    [SerializeField] private float speed = 1.0f;
    [SerializeField] private GameObject objetDeplacement;
    private float t = 0.0f;
    private bool mouvement = false;


    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {

        if (mouvement == true && t < 1.0f)
        {
            t += Time.deltaTime * speed;
            objetDeplacement.transform.position = Vector3.Lerp(departs.position, arriver, t);
        }
    }


    private void OnMouseDown()
    {
        mouvement = true;
    }
}
