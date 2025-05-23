using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class AnimManager : MonoBehaviour
{

    private Animator anim;
    // Start is called before the first frame update
    void Start()
    {
        anim = GetComponent<Animator>();
    }

    public void SetTrigger(string trigger)
    {
        Debug.Log("trigger");
        anim.SetTrigger(trigger);
    }
}
