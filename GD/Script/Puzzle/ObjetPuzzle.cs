using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using TMPro;
using UnityEngine.UI;
using DG.Tweening;
using System;

public class ObjetPuzzle : MonoBehaviour
{
    public bool selected {get => etat; set {etat = value; Toggle();}}
    private bool etat = false;
    public string itemId {get => id;}

    [SerializeField] private Image boutonImage;
    [SerializeField] private Sprite spriteOn;
    [SerializeField] private Sprite spriteOff;
    [SerializeField] float scaleOff;
    [SerializeField] float scaleOn;
    InventoryPuzzle inventoryPuzzle;
    [SerializeField] string id;


    // Start is called before the first frame update
    void Start()
    {
        inventoryPuzzle = GetComponentInParent<InventoryPuzzle>();
        Button button = GetComponent<Button>();
        button.onClick.AddListener(ButtonClicked);
    }

    private void ButtonClicked()
    {
        inventoryPuzzle.Select(this);
    }

    // Update is called once per frame
    void Update()
    {

    }


    public void Toggle()
    {
        transform.DOScale(etat ? scaleOn : scaleOff, 0.5f).SetEase(Ease.OutBack);


        if (boutonImage != null)
        {
            boutonImage.sprite = etat ? spriteOn : spriteOff;
        }

        Debug.Log("Etat actuel : " + etat);
    }
}
