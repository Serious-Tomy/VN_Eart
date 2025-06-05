using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ObjetInk : MonoBehaviour
{
    public string itemId { get => id; }

    [SerializeField] private string id;
    [SerializeField] private Sprite sprite;
    InventaireInk inventaireInk;


    // Start is called before the first frame update
    void Start()
    {
        inventaireInk.GetComponentInParent<InventaireInk>();
    }

    // Update is called once per frame
    void Update()
    {
        
    }
}
