using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[CreateAssetMenu(fileName ="Character", menuName ="E-ARTSUP/VN/Character", order = 0)]
public class SOCharacter : ScriptableObject, ISerializationCallbackReceiver
{
    [System.Serializable] public struct Expression
    {
        public string expressionName;
        public Sprite expressionSprite;
    }

    public string tag;
    public string characterName;
    public Color characterColor;
    public string defaultExpression;
    [SerializeField] private List<Expression> expressions;

    private Dictionary<string, Sprite> facesByName;
    private string hexColor;


    public void OnBeforeSerialize()
    {
        // keep empty
    }

    public void OnAfterDeserialize()
    {
        facesByName = new Dictionary<string, Sprite>();

        if ((expressions?.Count ?? 0) > 0)
        {
            foreach (Expression ex in expressions)
            {
                if (!facesByName.ContainsKey(ex.expressionName))
                    facesByName.Add(ex.expressionName, ex.expressionSprite);
                else
                    Debug.LogWarning("Duplicate expression " + ex.expressionName + " for " + characterName, this);
            }
            
            //expressions.Clear();
        }

        hexColor = "ff00ff";
        // TODO: trouver le bon format int > hexa
        //hexColor = characterColor.r.ToString("X4") + characterColor.g.ToString("X4") + characterColor.b.ToString("X4");
    }

    public Sprite GetFace(string faceName)
    {
        if (facesByName.ContainsKey(faceName))
        {
            return facesByName[faceName];
        }
        else if (facesByName.ContainsKey(defaultExpression))
        {
            if (faceName != "")
                Debug.LogWarning("Face " + faceName + " doesn't exist for " + characterName, this);

            return facesByName[defaultExpression];
        }

        Debug.LogWarning("Face " + faceName + " doesn't exist for " + characterName, this);
        return null;
    }

    public string GetColoredName()
    {
        return "<color=#" + hexColor + ">" + characterName + "</color>";
    }

    public Sprite GetDefaultFace()
    {
        return GetFace(defaultExpression);
    }
}
