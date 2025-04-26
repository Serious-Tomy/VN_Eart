using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UIElements;

public class LevierPuzzle : Puzzle
{
    

    void Start()
    {
        Activer = true;
        IsValide = true;
        box.material = mat_on;
    }


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