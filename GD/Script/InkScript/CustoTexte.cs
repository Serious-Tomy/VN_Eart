using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Febucci.UI.Core;
using Febucci.UI;
using vinkn;

public class CustoTexte : MonoBehaviour
{
    [SerializeField] TextAnimatorPlayer player;
    [SerializeField] StoryReader story;


    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        
    }

    public void Next()
    {
        if (player.textAnimator.allLettersShown == true)
        {
            story.Next();
        }
        else
        {
            player.SkipTypewriter();
        }
    }
}
