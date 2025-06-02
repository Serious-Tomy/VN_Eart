using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Video;

public class CalculObjet : Puzzle
{
    [SerializeField] private InventoryPuzzle inventoryPuzzle;

    // Start is called before the first frame update
    void Start()
    {

    }

    // Update is called once per frame
    void Update()
    {
        if (inventoryPuzzle.VerifObjet == 6)
        {
            Validate();
            Debug.Log(inventoryPuzzle.VerifObjet);
        }
    }
}
