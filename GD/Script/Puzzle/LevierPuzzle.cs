using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UIElements;

public class LevierPuzzle : Puzzle
{
    

    void Start()
    {
        LevierActivable = true;
        IsValide = true;
        box.material = mat_on;
    }


    void Update()
    {

    }

    private void OnMouseDown()
    {
        if (LevierActivable == true)
        {
            Validate();
        }
    }
    public void Activate()
    {
        box.material = mat_on;
        LevierActivable = true;
    }

}