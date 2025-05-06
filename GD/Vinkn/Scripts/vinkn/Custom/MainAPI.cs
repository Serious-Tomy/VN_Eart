using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace vinkn
{
    [RequireComponent(typeof(StoryReader))]
    public class MainAPI : MonoBehaviour
    {
        StoryReader reader;
        VNEngine engine;

        // Start is called before the first frame update
        void Start()
        {
            reader = GetComponent<StoryReader>();
            engine = GameObjectUtility.FindObjectOfType<VNEngine>();
            SetupGlobalMethods();
        }

        void SetupGlobalMethods()
        {
            reader.story.BindExternalFunction("changeBg", (string name) => engine.FadeToBackground(name, 0));
            reader.story.BindExternalFunction("fadeBg", (string name, float duration) => engine.FadeToBackground(name, duration));
            reader.story.BindExternalFunction("flipX", (string name) => engine.FlipXChar(name));
            reader.story.BindExternalFunction("flipY", (string name) => engine.FlipYChar(name));
            reader.story.BindExternalFunction("show", (string name) => engine.DisplayChar(name, true));
            reader.story.BindExternalFunction("hide", (string name) => engine.DisplayChar(name, false));
            reader.story.BindExternalFunction("fadeIn", (string name, float duration) => engine.DisplayChar(name, true, duration));
            reader.story.BindExternalFunction("fadeOut", (string name, float duration) => engine.DisplayChar(name, false, duration));
            //reader.story.BindExternalFunction("thenWaitPlayer", () => ThenWaitPlayer());
            reader.story.BindExternalFunction("face", (string character, string name) => engine.SetEmotion(character, name));
            reader.story.BindExternalFunction("moveTo", (string character, string name, float duration) => engine.MoveTo(character, name, duration));
            reader.story.BindExternalFunction("placeTo", (string character, string name) => engine.MoveTo(character, name, 0));
        }
    }
}
