using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace vinkn
{
    public class DisplayAnchor : MonoBehaviour
    {
        public string tagID => inkTag;

        [SerializeField] string inkTag;

        private void Start()
        {
            GameObjectUtility.FindObjectOfType<VNEngine>()?.Add(this);
            gameObject.name = "Anchor_" + inkTag;
        }

    }
}