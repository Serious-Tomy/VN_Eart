using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class BoitePuzzle : Puzzle
{


    // Start is called before the first frame update
    void Start()
    {
        box.material = mat_off;
        IsValide = true;
    }

    // Update is called once per frame
    void Update()
    {
        
    } 
    private void OnMouseDown()
    {
        if (Activer == true)
        {
            Validate();
        }

    }

    public void Activate()
    {
        box.material = mat_on;
        Activer = true;
    }
}
