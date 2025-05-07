using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MouvementGrille : MonoBehaviour
{

    public Vector2Int positionGrille;
    [SerializeField] private float vitesse = 5f;

    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        
    }

    public void Deplacement(Vector2Int nouvellePos)
    {
        positionGrille = nouvellePos;
        Vector3 cible = new Vector3(nouvellePos.x, nouvellePos.y, 0);
        transform.position = cible;
    }

}
