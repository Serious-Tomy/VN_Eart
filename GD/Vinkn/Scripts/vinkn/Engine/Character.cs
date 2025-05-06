using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace vinkn
{
    public class Character : EDisplayable
    {
        [Header("Character")]
        [SerializeField] SOCharacter definition;
        public SOCharacter details => definition;

        // Start is called before the first frame update
        protected override void Init(VNEngine engine)
        {
            type = InkObjectType.CHARACTER;

            if (definition != null)
            {
                itemID = definition.tag.ToLower();
                gameObject.name = "Character_" + itemID;
            }
            else
            {
                gameObject.name = "Character_Null";
                itemID = itemID.ToLower();
            }

            engine.AddCharacter(this);
        }
    }
}