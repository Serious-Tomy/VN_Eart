using System.Collections;
using System.Collections.Generic;
using Unity.Collections.LowLevel.Unsafe;
using UnityEngine;

public class GameManager : MonoBehaviour
{
    [SerializeField] private MouvementGrille player;
    [SerializeField] private MouvementGrille ennemy;
    private bool tourJoueur = true;


    // Start is called before the first frame update
    void Start()
    {

    }

    // Update is called once per frame
    void Update()
    {
        if (tourJoueur == true)
        {

        }
        else
        {

        }
    }


    private void ControleJoueur()
    {
        Vector2Int dir = Vector2Int.zero;

        if (Input.GetKey(KeyCode.UpArrow))
        {
            dir = Vector2Int.up;
        }
        else if (Input.GetKey(KeyCode.DownArrow))
        {
            dir = Vector2Int.down;
        }
        else if (Input.GetKey(KeyCode.LeftArrow))
        {
            dir = Vector2Int.left;
        }
        else if (Input.GetKey(KeyCode.RightArrow))
        {
            dir = Vector2Int.right;
        }

        if (dir != Vector2Int.zero)
        {
            Vector2Int nouvellePos = player.positionGrille + dir;
            player.Deplacement(nouvellePos);
            tourJoueur = true;
        }


    }
        
    private void ControleIA()
    {
        Vector2Int[] direction = { Vector2Int.up, Vector2Int.down, Vector2Int.left, Vector2Int.right };
        Vector2Int mouvement = direction[Random.Range(0, direction.Length)];
        Vector2Int nouvellePosition = ennemy.positionGrille + mouvement;
        ennemy.Deplacement(nouvellePosition);
        tourJoueur = true;

    }
}
