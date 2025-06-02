using System.Collections;
using System.Collections.Generic;
using Unity.VisualScripting;
using UnityEngine;
using UnityEngine.UI;
using vinkn;

public class TimerCount : MonoBehaviour
{
    [SerializeField] Slider slider;
    // Start is called before the first frame update
    void Start()
    {
        slider.value = slider.maxValue;
    }

    // Update is called once per frame
    void Update()
    {
        
    }

    public void SliderCount(string _, object progress)
    {
        int count = GameObjectUtility.AsType<int>(progress);

        slider.value = count;
    }
}
