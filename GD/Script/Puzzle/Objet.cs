using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using TMPro;
using UnityEngine.UI;
using Unity.VisualScripting;

public class Objet : MonoBehaviour
{
    public bool etat = false;

    [SerializeField] private Image boutonImage;
    [SerializeField] private Sprite spriteOn;
    [SerializeField] private Sprite spriteOff;



    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        if (this.GetComponent<Button>(OnButtonClick))
        {

        }
    }


    public void Levier()
    {
        etat = !etat;

        if (boutonImage != null)
        {
            boutonImage.sprite = etat ? spriteOn : spriteOff;
        }

        Debug.Log("Etat actuel : " + etat);
    }
}
