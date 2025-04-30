using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;

public class Souris : MonoBehaviour
{

    [SerializeField] private Texture2D arrow;
    // Start is called before the first frame update


    void Start()
    {
        Cursor.SetCursor(arrow, Vector2.zero, CursorMode.ForceSoftware);
        
    }

}
