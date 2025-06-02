using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class InventoryPuzzle : MonoBehaviour
{
    public ObjetPuzzle currentSelection {get; private set;}

    [SerializeField] ObjetPuzzle defaultSelection;
    public int VerifObjet = 0;


    // Start is called before the first frame update
    void Start()
    {
        currentSelection = defaultSelection;
    }


    public void Select(ObjetPuzzle item)
    {
        if (currentSelection != null)
        {
            currentSelection.selected = false;
        }

        if (currentSelection == item)
        {
            currentSelection = null;
            return;
        }

        currentSelection = item;
        currentSelection.selected = true;
    }


    public void AddPuzzle(ObjetPuzzle item)
    {
        Instantiate(item, transform);
    }

    public void RemoveSelection()
    {
        VerifObjet += 1;
        Debug.Log("Y a plus d'objet !!!!!");
        Destroy(currentSelection.gameObject);
        currentSelection = null;

    }

}
