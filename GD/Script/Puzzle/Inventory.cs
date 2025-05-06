using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Inventory : MonoBehaviour
{
    public Objet currentSelection {get; private set;}

    [SerializeField] Objet defaultSelection;


    // Start is called before the first frame update
    void Start()
    {
        currentSelection = defaultSelection;
    }


    public void Select(Objet item)
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

    public void Add(Objet item)
    {
        Instantiate(item, transform);
    }

    public void RemoveSelection()
    {
        Destroy(currentSelection.gameObject);
        currentSelection = null;
    }

}
