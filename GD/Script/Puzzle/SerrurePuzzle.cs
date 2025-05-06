using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using TMPro;
using UnityEngine.UI;

public class SerrurePuzzle : Puzzle
{
    [SerializeField] Objet key;
    [SerializeField] Inventory inventory;



    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        
    }

    private void OnMouseDown()
    {
        if (inventory.currentSelection == null)
        {
            return;
        }

        if (inventory.currentSelection.itemId == key.itemId)
        {
            IsValide = true;
            Validate();
            inventory.RemoveSelection();
        }

    }
}
