using System.Collections;
using System.Collections.Generic;
using TMPro;
using UnityEngine;

public class CharacterDisplay : MonoBehaviour
{
    [SerializeField] TMP_Text characterName;

    // Start is called before the first frame update
    void Start()
    {
        
    }

    public void SetCharacter(SOCharacter ch)
    {
        characterName.text = ch.characterName;
        characterName.color = ch.characterColor;
    }
}
