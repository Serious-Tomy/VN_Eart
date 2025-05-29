INCLUDE 2d_api.ink

// Départ
-> Introduction

== ListeDesVAR ==

//VAR Générale
VAR Materiaux = "Aucun"
VAR Argent = 0
VAR NbAlchool = 0

//VAR Cave
VAR BunkerCheck = false
VAR BadEnd = false

//VAR Antiquaire
VAR PicoDehors = false

//VAR Mairie
VAR connai_boite = false
VAR ruby_nom = "ruby"
VAR Expulsion = false
VAR voiture_accident = false

//VAR Clochard
VAR clochardstate = "normale"
VAR CryptoMoney = false
VAR ClodoKo = false
VAR NNFrappe = 0
VAR NBbouteillelancer = 0
VAR Spray = false
VAR ColèreClodo = 0

//VAR Interieur
VAR IPad = false
VAR Bunker = false
VAR TrappeOpen = false
VAR Cle = false

//VAR restaurant
VAR RedPig = false
VAR RubyDehors = false
VAR BoissEnergique = false
VAR Cafeine = false

//VAR Ruin
VAR SacCiment = false
VAR Lampe = false
VAR C4 = false
VAR porteOuverte = false
VAR LivreComptes = false
VAR NoGlasse = false

//VAR GroinMerlin
VAR Bois = false
VAR Brique = false
VAR Paille = false
VAR CimentMain = false

//VAR Puits
VAR picoDansPuits = false
VAR rubyDansPuits = false
VAR mathéoDansPuits = false
VAR sortisDuPuits = true
VAR connaissentPuits = false
VAR Eau = false
VAR PlusDSaut = false

// Permet de savoir qui est où et était où ?
VAR pièceActuelle = "Maison"
VAR frere = "??????"
VAR last_visited = ""
VAR ChoixCocho = false
-> ListeDesVAR

== return_to_last ==
{last_visited == "Interrieur": -> Interieur}
{last_visited == "Cave": -> Cave}
{last_visited == "Antiquaire": -> Antiquaire}
{last_visited == "Clochard": -> Clochard}
{last_visited == "Ruine": -> Ruine}
{last_visited == "Puit": -> Puit}
{last_visited == "Mairie": -> Mairie}
{last_visited == "AuChamp": -> AuChamp}
{last_visited == "Restaurent": -> Restaurant}
{last_visited == "GroinMerlin": -> GroinMerlin}
{last_visited == "chapitre_1": }
{last_visited == "chapitre_2": }

== Quels_chon ==
~ChoixCocho = true
+ [Pico]
~frere = "Pico"
->return_to_last
+ [Ruby]
~frere = "Ruby"
->return_to_last
+ [Mathéo]
~frere = "Mathéo"
->return_to_last

=== ActionPrincipale===
+ [Ce déplacer] Déplacement ...
-> ActionChangeScene
+ {pièceActuelle == "Maison"} [Interrieur]
-> Interieur
+ {pièceActuelle == "Maison" && TrappeOpen == true} [Cave]
-> Cave
+ {pièceActuelle == "Ruelle"} [Antiquaire]
-> Antiquaire
+ {pièceActuelle == "Ruelle"} [Clochard]
-> Clochard
+ {pièceActuelle == "Ruelle"} [Ruine]
-> Ruine
+ {pièceActuelle == "Place du village"} [Puit]
-> Puit
+ {pièceActuelle == "Place du village"} [Mairie]
-> Mairie
+ {pièceActuelle == "Allée commerçantes"} [Au Champ]
-> AuChamp
+ {pièceActuelle == "Allée commerçantes"} [Restaurant]
-> Restaurant
+ {pièceActuelle == "Allée commerçantes"} [Groin Merlin]
-> GroinMerlin
//Zone principale

=== ActionChangeScene===
+ {pièceActuelle != "Maison"} [Maison] {~texte 1|texte 2|texte 3}
//~ changeBg ("Maison")
~ pièceActuelle = "Maison"
~ last_visited = "Maison"
-> ActionPrincipale
+ {pièceActuelle != "Ruelle"} [Ruelle] {~texte 1|texte 2|texte 3}
//~ changeBg ("Ruelle")
//~ show ("clochardstate")
~ pièceActuelle = "Ruelle"
~ last_visited = "Ruelle"
-> ActionPrincipale
+ {pièceActuelle != "Place du village"} [Place du village] {~texte 1|texte 2|texte 3}
//~ changeBg ("Pvillage")
~ pièceActuelle = "Place du village"
~ last_visited = "Place du village"
-> ActionPrincipale
+ {pièceActuelle != "Allée commerçantes"} [Allée commerçantes] {~texte 1|texte 2|texte 3}
//~ changeBg ("AlléeC")
~ pièceActuelle = "Allée commerçantes"
~ last_visited = "Allée commerçantes"
-> ActionPrincipale

== Introduction ==
//~ changeBg ("")
//~ music ("")
Il était une fois en Cochonnésie, dans le paisible village de Cochon-les-Bains, trois petits cochons qui coulais des jours heureux avec leur maman .
Sauf qu’à côté, au Perrault, vivait les Loups ...
Pendant longtemps, tout le monde restait de son côté .
Pas d’histoire .
Pas de problème .
Mais ce matin-là ... 
// *Le téléphone sonne.*
C’est le père.
En mission dans les terres du Perrault.
Sa voix tremble ...
//~ changeBg ("")
“Mes enfants, l'heures est grave !"
"Les loups ont lancer une bombe à gaz, et pas n’importe quel gaz ..."
"Il transforme les cochons en chaires à saucisses et autre charcuterie !"
"Là-bas, ils meurent de faim ..." 
"C’est leur plan de survie, et vous êtes au menu !”
“Vous avez trois heures ..."
"Trouvez un abri et Renforcez-le !"
"Je reviendrai si je le peux.”
// *Sa coupe, bip de téléphone*
//~ changeBg ("")
ruby: PICO LÂCHE CETTE BOUTEILLE !!
ruby: T’AS PAS ENTENDU ???
ruby: ON VA TOUS FINIR EN RILLETTES !!
pico: Hein ? 
pico: Papa revient ? 
pico: C’est cool ça !
ruby: NON IDIOT !
ruby: ON A TROIS HEURES AVANT D’ÊTRE FUMÉS COMME DES SAUCISSONS !
mathéo: Une bombe qui transforme les gens en knackis ?
mathéo: Relax, vous croyez vraiment à ça ?
ruby: C’est pas une blague !
ruby: Papa ne ferait JAMAIS ça !
ruby: On doit trouver un abrie, la barricader, et SURVIVRE !
mathéo: C’est une fake news ...
mathéo: Comme si on allaient être transformer en jambon ...
pico: A bha c'est sûr ! 
pico: Sa te changerait pas .
pico: T'est déjà un Andouille ...
ruby: (Oh, y'a une MAJ Clash of Clans ...)
mathéo: Ok, je vous suis .
mathéo: Sa fera mon footing .
pico: Et si on utilisait la cave, ça devrais le faire, non ?
ruby: Pas une seconde à perdre, trouvons la caves .
-> ActionPrincipale

== Interieur ==
~ last_visited = "Interrieur"
{ Bunker == false:
+ [Chercher la cave]
    ++ [Pico] 
    pico : Bon ...
    pico : Si je me souvien bien .
    pico : Ce tapis fait office de cache .
    // *Le soulève d’un coup sec*
    pico : Voilà la trappe !
    ~ Bunker = true
    -> Interieur

    ++ [Ruby]
    ruby : Si j’étais une cave, je serais où ?
    // *Regarde le canapé, fait glisser une lampe*
    ruby : Ce canapé est trop lourd pour cacher quoi que ce soit d’utile.
    ruby : Et ce tapis ...
    ruby : Non rien ...
    ruby : Rien d'intéressant .
    ruby : Cette maison est une plaie niveau ergonomie !
    -> Interieur
    
    ++ [Mathéo]
    mathéo : Une cave ... 
    mathéo : C’est sous terre .
    mathéo : Je vais voir dans le jardin !
    // *Claque la porte et commence à creuser*
    mathéo : J’étais censé faire quoi déjà ?
    mathéo : ...Ah oui, la cave !
    mathéo : J'ai surement pas creuser assez profond ...
    // *recommence à creuser*
    ruby : Arrête de creuser ! (On à pas le temps pour tes conneries !)
    -> Interieur
}

+ [Chercher des objets utiles]
    ++ [Pico]
    // *fouille dans le frigo*
    pico : Rien.
    pico : Pas même un canette de bière ...
    // *regarde dans la poubelle*
    pico : Pourquoi y a une tong ici ?
    pico : Salut... 
    pico : Colonel Flip-Flop.
    pico : Tu saurais pas où trouver une bonne bouteil ?
    ruby : Pico, arrête de jouer avec cette tong ... 
    -> Interieur

   ++ [Ruby] { IPad == false }
    ruby : Où est-ce que j’ai mis mon iPad ?
    // *ouvre des tiroirs, pousse des magazines, soulève des coussins*
    ruby : Ah-ha !
    ruby : Il était entre deux boîtes de pizza .
    ruby : Toujours 73% de batterie.
    ruby : Le destin est avec moi !
    ~ IPad = true
    -> Interieur
    
    ** [Mathéo]
    mathéo : C’est quoi cette boîte énorme ?
    // *la soulève, la secoue*
    mathéo : (C'est pas léger en tout cas !)
    mathéo : 30 000 pièces, le puzzle ?!
    mathéo : Y a de quoi en faire du papier paint !
    mathéo : Allez, je prends.
    ~ Materiaux = "Puzzle"
    -> Interieur
    
+ [Ouvrir la cave] { Bunker == true && TrappeOpen == false}
{ Cle == true :
++ [Pico]
    pico : Enfin !
    pico : Elle nous aura fait courir !
    pico : (Hop là, on ouvre ...)
    // *CLIC*
    pico : Oh ..., ça pue le renfermé ...
    pico : ET L'ALCOOL !
    pico : Allez les nazes ! 
    pico : On descend ou quoi ?
    ~ TrappeOpen = true
    -> Cave

++ [Ruby]
    ruby : Le dénouement de toute une aventure ...
    // *CLIC*
    ruby : Voilà, ouverte !
    ruby : Maintenant... préparez-vous à descendre dans l’inconnu.
    pico : C'est bon la MJ, on n'est pas dans l'un de tes JDR !
    ~ TrappeOpen = true
    -> Cave

** [Mathéo]
    mathéo : Bon... 
    mathéo : On a la clé...
    mathéo : On a la trappe...
    mathéo : Et ...
    mathéo : Sa s'ouvrent pas .
    mathéo : C’est un tour de magie ou ? 
    mathéo : c’est juste vieux ...
    ruby : (T'est juste le bouffon que tu pensse être ...)
    pico : Laisse moi faire .
    ~ TrappeOpen = true
    -> Cave
  } 
  
  { Cle == false :
  ** [Pico]
    pico : Une serrure ?
    pico : Maman ...
    mathéo : Je peux peut-être l’ouvrir avec un marteau ?
    pico : Non et non, c’est mort.
    pico : Y’a pas moyen d’ouvrir ce truc sans la clé ...
    -> Interieur
    
    ** [Ruby]
        ruby : Verrouillée ?
        ruby : Sérieux ?
        ruby : Et évidemment, pas de clé.
        -> Interieur
        
    ** [Mathéo]
        mathéo : Qui la verrouillé sérieusement ?
        ruby : Maman à tout les coup .
        mathéo : Ok, logique ...
        mathéo : On reviendra quand on aura le sésame .
        -> Interieur
    }
    
pico : C'est surement maman qui à a clé !
mathéo : Elle est parti ou déja ?
ruby : A la Mairie .
pico : Ok, tous à la Mairie !      
-> Interieur

+ [Sortir]
-> ActionPrincipale

== Cave ==
~ last_visited = "Cave"
"Texte d'introduction au lieu" {~texte 1|texte 2|texte 3}
+ [Action 1]
++ [Pico Chon]
-> Cave

++ [Ruby Chon]
-> Cave

++ [Mathéo Chon]
-> Cave

+ [Action 2]
++ [Pico Chon]
-> Cave

++ [Ruby Chon]
-> Cave

++ [Mathéo Chon]
-> Cave

+ [Action 3]
++ [Pico Chon]
-> Cave

++ [Ruby Chon]
-> Cave

++ [Mathéo Chon]
-> Cave

+ {Materiaux != "Aucun"} [Réparer la cave] Vous appliquer {Materiaux} à la cave
~ BunkerCheck = true
-> Cave

+ {BunkerCheck == true} [Fermer la cave]
narrateur : Les trois frère suite à la fermeture, attendir la fin ...
narrateur: Un silence pesant règnait dans la cave ...
{Materiaux == "Aucun":
narrateur : Bon ...
narrateur : Ils n’ont rien renforcé ...
narrateur : Pas une planche .
narrateur : Pas un bout de scotch !
narrateur : Rien .
narrateur : Nos trois petits génies ont donc décidé de faire confiance... à la chance ?
narrateur : À l’univers ...
narrateur : À l’amour cosmique ...
narrateur : ...
narrateur : Mais contre une bombe qui transforme les cochons en charcuterie fine ...
narrateur : La foi, n’est pas une stratégie avisé ...
// *transformation en charcuterie*
narrateur : Et voilà .
narrateur : En quelques secondes, c’est terminé .
narrateur : Les murs sentent le bacon .
narrateur : Et dans un coin ...
narrateur : Un iPad fondu .
narrateur : Ils auront au moins tenté quelque chose ...
narrateur : En fait, Non .
narrateur : Non ...
narrateur : Ils ont juste espéré très très fort .
~ BadEnd = true
}
{Materiaux == "Laine":
//~ changeBg ("")
//~ music ("")
narrateur : Bon, cette fois ...
narrateur : Ils ont mis quelque chose .
narrateur : Une matière rare ...
narrateur : Noble !
narrateur : De la laine .
narrateur : DE ...
narrateur : La ...
narrateur : LAINE !
narrateur : Voilà donc l’armure ultime choisie pour contrer une ogive chimique carnivore ...
narrateur : Un tricot .
narrateur : Une pelote .
narrateur : Un espoir en cachemire !
narrateur : L’ambiance est douce, certe .
narrateur : Confortable, même .
narrateur : Mais pas très étanche ...
narrateur : Le gaz entre comme chez lui ...
narrateur : S’installe .
narrateur : Visite .
// *transformation en charcuterie*
narrateur : Il transforme ...
narrateur : Nos trois héros, désormais des chaussons fumés .
narrateur : Repose désormais sur une écharpe carbonisée ...
narrateur : Quels farce !
}
-> END
{Materiaux == "PostCocho":
//~ changeBg ("cave")
//~ music ("dramaSadLoop")
narrateur : Cette fois ...
narrateur : Ils se sont surpassés !
narrateur : L’idée est brillante .
narrateur : Visionnaire, même !
narrateur : Pour se protéger d’une arme chimique ...
narrateur : Ils choisirent ...
narrateur : Des posters .
narrateur : Oui .
narrateur : Des posters .
narrateur : Des affiches en papier glacé .
narrateur : Collées au mur comme des sortilèges anti-apocalypse.
narrateur : ...
narrateur : Et pas n’importe lesquels !
narrateur : Des posters de cochons en bikini ...
narrateur : Avec des poses aguicheuses .
narrateur : Des lunettes de soleil .
narrateur : Et les flamants roses gonflables en arrière-plan ...
narrateur : Nos héros les ont regardés, confiants .
narrateur : Le duo d'un sourir béat .
pico: “T’inquiète, ça va faire barrière.”
matheo: "O... oeee ..."
narrateur : Dirent t'ils, les yeux fixé sur les murs ...
narrateur : Le gaz arriva, traversa, "jugea" même .
narrateur : Les posters ...
narrateur : Fondent .
narrateur : Comme leurs espoirs .
narrateur : L’air devient irrespirable .
// *transformation en charcuterie*
narrateur : Et l’odeur ?
narrateur : Un savant mélange de papier mouillé, et de sueur au effluve de jambon chaud.
narrateur : Sauver sa vie avec des affiches sexy ...
narrateur : C’est ... 
narrateur : Audacieux !
}
-> END
{Materiaux == "Rigolofleur":
//~ changeBg ("")
//~ music ("")
narrateur : Ils ont décoré la cave .
narrateur : C’est mignon .
narrateur : Des fleurs partout ...
narrateur : Des dizaines de Rigolodrôles, soigneusement disposées dans chaque recoin .
narrateur : Elles sourient .
narrateur : Elles dansent .
narrateur : On se croirait dans un festival hippie .
narrateur : Mais à la différence près, que dans ce festival .
narrateur : Tout le monde meurt à la fin ...
narrateur : Car derrière son sourire permanent ...
narrateur : C’est surtout un champignon chimique ambulant !
narrateur : Son pollen ?
narrateur : Du LSD naturel ...
narrateur : Planter dans une cave fermée hermétiquement ...
narrateur : Avec un peu de chaleur ...
narrateur : La réaction est immédiate !
narrateur : Pico voit un cochon président lui parler en binaire .
narrateur : Mathéo hurle à ses muscles qu’ils l’ont trahi .
narrateur : Ruby code un jeu vidéo avec une boîte de thon ...
narrateur : Et pendant ce festival psychédélique...
narrateur : La bombe tombe .
narrateur : Mais eux…
narrateur : Ils la voient comme un gros marshmallow qui descend du ciel !
narrateur : Spoiler !
narrateur : Ce n’était pas un marshmallow .
// *transformation en charcuterie*
narrateur : Quelques instants plus tard ...
narrateur : Une douce odeur fumé se fit sentire dans la cave .
narrateur : Ruby, Pico et Mathéo ?
narrateur : Trois bouquet de tranches de rosette artisanale ...
narrateur : Sérieusement... 
narrateur : Qui fait confiance à une plante qui danse ?!
}
-> END
{Materiaux == "Puzzle":
narrateur : Bon .
narrateur : C’est officiel .
narrateur : Ces trois cervelles de jambon ont décidé de se protéger ...
narrateur : Avec un puzzle ...
narrateur : De 30 000 pièces plus exactement !
narrateur : Une boîte aussi grosse que leur naïveté ...
narrateur : Collé à la main, le tout tenait à peine .
narrateur : Mais c’était “beau”, selon Mathéo .
narrateur : Quand la bombe percuta le sol .
narrateur : Son souffle ne rencontra aucune résistance ...
narrateur : S’infiltrant doucement entre les pièces du puzzle .
narrateur : Il ne falue que quelques secondes pour que l'on retrouve dans la cave ...
// *transformation en charcuterie*
narrateur : Trois amoncelement de dés de jambon parfaitement cubiques .
narrateur : Un miracle de la découpe moléculaire !
narrateur : Ironique ...
narrateur : Non ?
narrateur : Du jambon 500 pièces, édition limitée !
narrateur : Montage 4 heures .
narrateur : Durée de vie 3 minutes .
narrateur : Certification charcutière !
narrateur : Leur dernière œuvre collective ...
}
-> END
{Materiaux == "Porte":
narrateur : Alors là...
narrateur : Là !
narrateur : Nos petits cochons ont trouvé des portes .
narrateur : Pas des portes blindées, non non ...
narrateur : Des portes en bois massif .
narrateur : Et qu’ont-ils fait avec ?
narrateur : Ils les ont appuyées contre les murs, façon bricolage d’urgence .
narrateur : Avec, attention ...
narrateur : Du scotch .
narrateur : Et deux clous, tordus .
narrateur : Par Pico ... <>
<>(On reconnait l'artiste ...)
narrateur : Dé le premier choc, suite à la frappe ...
narrateur : Une porte chuta .
narrateur : Puis deux .
narrateur : Puis trois ...
narrateur : L’effet domino était spectaculaire !
narrateur : Le gaz, lui, a juste attendu que la forteresse se replie sur elle-même avant d'entrer en scène .
narrateur : Ce qu’on a retrouvé ensuite ?
narrateur : Trois terrines de luxe, cuites à l’étouffée dans une chambre en bois noble .
narrateur : Parfum résine .
narrateur : Texture fondante .
narrateur : De la charcuterie de prestige, édition bois de feuillus !
}
-> END
{Materiaux == "Enceinte":
narrateur : C’est là qu’en en est la stratégie ?
narrateur : Mettre la musique à fond ...
narrateur : Mais pas juste fort .
narrateur : AU MAXIMUM !
narrateur : Et leur idée derrière ça ?
narrateur : Créer un mur du son ...
narrateur : Littéralement !
narrateur : "Si le bruit peut casser un verre, il peut bloquer un gaz", disait Ruby, très sérieuse .
narrateur : Logique ...
narrateur : Alors ils mirent du Pigstep .
// *Pigstep Saturer*
narrateur : LA CAVE VIBRAIT COMME UN TAMBOURE DE MACHINE A LAVER EN PLEINE CRISE EXISTANTIEL .
narrateur : ET LE GAZ ?
narrateur : IL A RALENTI, ETONNAMENT !
narrateur : PAS STOPPE, HEIN !
narrateur : MAIS DESORIENTE ...
narrateur : COMME S’IL AVAIT LUI AUSSI UN PEU HONTE D’ENTRER LA-DEDANS !
// *Eteind boom box*
narrateur : Résultat ?
narrateur : Nos trois héros sont toujours vivants .
narrateur : Mais disons que... <>
<>le jambon a commencé à mariner ...
narrateur : Ruby a une oreille en rillette .
narrateur : Mathéo transpire du saucisson sec .
narrateur : Et Pico...
narrateur : Pico cloche quand il marche cette andouille .
narrateur : Littéralement !
narrateur : Mais hé ...
narrateur : Ils ont survécu !
narrateur : Un peu mutants ...
narrateur : Mais encore capables de danser .
narrateur : Comme quoi, parfois, la musique adoucit vraiment les mœurs .
narrateur : Même celles d’une bombe ...
}
-> END
{Materiaux == "CochoMobile":
narrateur : Alors là ...
narrateur : Une vraie trouvaille !
narrateur : "La Cochonou Mobile", édition collectionneur, stickers saucisson inclus .
narrateur : Voiture chérie du maire de Cochon-les-Bains .
narrateur : Pièce par pièce ...
narrateur : Ils la démontère !
narrateur : Portière, capot, pare-chocs ...
narrateur : Soudant le tout sur les murs de la cave comme des plaques d’armure .

narrateur : A l'instant où la bombe a explosé ...
narrateur : Miracle !
narrateur : La structure a tenu !
narrateur : Enfin ... <>
<>un peu ?
narrateur : Le gaz s’est tout de même infiltré par les trous du pot d’échappement ...
narrateur : Ils ont survécu !
narrateur : Oui .
narrateur : Mais ...
narrateur : Ruby a les orteilles en tranches de mortadelle .
narrateur : Mathéo a les cuisses marbrées comme du jambon de pays .
narrateur : Et Pico sent fortement le pâté ... <>
<>(pas sur qu'il et vraiment changer donc ...)
narrateur : Bref .
narrateur : Une victoire tiède, à demi-salée ...
narrateur : Mais au moins, ils sont vivants !
narrateur : À condition de rester bien au frais ...
}
-> END
{Materiaux == "OverTune":
narrateur : L’argent ne fait pas le bonheur .
narrateur : Mais un excellents murs anti-gaz ...
narrateur : Car oui !
narrateur : Il faut dire qu’avec tout ce qu’ils avaient volé ...
narrateur : Ou “gagné”, comme dirait le clochard .
narrateur : Ils pouvaient se le permettre !
narrateur : Des liasses de billets, collées directement sur les parois de la cave .
narrateur : Une isolation "premium", édition banque centrale !
narrateur : Alors ils ont tout mis !
narrateur : Billets froissés ...
narrateur : Billets neufs ...
narrateur : Même un chèque-cadeau de chez ...<>
<> Picard ?
narrateur : Et incroyable comme cela puisse être ...
narrateur : Ca a un peu marché !
narrateur : Le gaz a été ralenti par l’épaisseur des devises .
narrateur : Mais pas stoppé ...
narrateur : Du coup ...
narrateur : Ruby est moitié cochon, terrine ...
narrateur : Pico suinte le saucisson sec ...
narrateur : Et Mathéo a un fessier en filet mignon, estampillé “Banque de Cochonnésie” ...
narrateur : Leurs économies ?
narrateur : Évaporées ...
narrateur : Bref...
narrateur : Ils ont survécu ...
narrateur : A sec, et légèrement comestibles .
narrateur : Comme quoi, même en temps de crise, ... 
narrateur : l’investissement immobilier reste risqué !
}
-> END
{Materiaux == "PatCroute":
narrateur : Non .
narrateur : NON !
narrateur : ET NON !!!
narrateur : Je refuse de commenter ça sérieusement !
narrateur : Ils ...
narrateur : Ils ont littéralement tartiné les murs .
narrateur : Avec du pâté en croûte végétarien !?!
narrateur : Pas du béton .
narrateur : Pas du métal .
narrateur : Non !
narrateur : Du pâté ...
narrateur : En croût ..!
narrateur : VEGETALE !!!
narrateur : Le pire ..., <>
<>c’est que ça a un peu marché !
narrateur : Quand le gaz c'est infiltré ...
narrateur : Il fut frainé par une couche de pois-chiches compacts, <>
<> une barrière de céleri et ...
narrateur : Une épaisse purée d’aubergine tiède ... (Heurk !)
narrateur : Conclusion ?
narrateur : Pico a des doigts en chorizo .
narrateur : Mathéo a des joues en tapenade .
narrateur : Et Ruby éternue des Knacks .
narrateur : C'EST TROIS JAMBON ONT SURVRECUE !
narrateur : Je ...
narrateur : Je suis sincèrement perturbé ...
narrateur : Est-ce qu’on vient de battre une arme de destruction massive avec ... <>
<> une entrée froide ?
narrateur : Est-ce que je suis le seul à ressentir un début de migraine ?
narrateur : Bref .
narrateur : Bravo à eux .
narrateur : Et honte à la logique !
}
-> END
{Materiaux == "PeauBete":
narrateur : Donc ...
narrateur : Ils ont acheté des peaux de loutre ...
narrateur : C’est ce que disait le clochard en short dans la ruelle en tout cas.
narrateur : Bon ...
narrateur : Honètement ?
narrateur : Ca pue le coup foireux ...
narrateur : Et pas seulement à cause de l’odeur rance des peaux ...
narrateur : Puis bizarrement ...<> 
<>, ça a un peu repousser le gaze .
narrateur : Peut-être parce qu’il a reconue une menace ?
narrateur : En tout cas, nos trois petits malins ont survécu !
narrateur : À moitié ...
narrateur : Pico a désormais un museau en salami .
narrateur : Ruby a les avant bras en bacon .
narrateur : Et Mathéo a l'échine en grillote .
narrateur : Mais ce n’est pas ce qui me dérange le plus .
narrateur : Non ...
narrateur : Etaice vraiment de la loutre ?
}
-> END
{Materiaux == "Porkia33000":
narrateur : Alors ça !
narrateur : Ça dépasse toutes ma compréension ...
narrateur : Et mes limites de tolérance .
narrateur : Les trois frères ont posé un vieux téléphone au centre de la pièce.
narrateur : Le Porkia 3310 .
narrateur : Un modèle si résistant ... 
narrateur : QU'IL PLIE LES LOIS DE LA PHYSIQUE ELLE MÊME !
narrateur : La bombe une fois tombée, le gaz s’est infiltré par tous les interstices .
narrateur : Mais à trois mètres du téléphone ...
narrateur : Il disparu .
narrateur : Dissous ...
narrateur : Dissipé !
narrateur : Évaporé dans une bulle d’incompréhension technique .
narrateur : Le Porkia 3310 n’avais pas bougé .
narrateur : Ruby pleurait de joie .
narrateur : Mathéo parlait de “prophète à touches” .
narrateur : Pico lui cassait des noix avec ...
narrateur : "Un apéro pour fêter ça ?", dis t'il avec bougon ...
narrateur : Et moi ?
narrateur : Je regardais la scène, en me demandant si la science a encore un sens ...
narrateur : Sincèrement ?
narrateur : Bravo !
narrateur : Notre fine équipe à survécu ...<>
<>, grâce à un rectangle de plastique de l’ère glaciaire .
narrateur : Félicitations !
}
-> END
{Materiaux == "Ciment":
narrateur : ...
narrateur : Attendez ...
narrateur : Est-ce que...<>
<>, est-ce que je rêve ?
narrateur : Du ciment ?
narrateur : ILS ONT UTILISÉ DU CIMENT !
narrateur : Juste ...
narrateur : Du béton .
narrateur : Un bon vieux mélange gris, moche, et ULTRA efficace .
narrateur : Ça tartinait les murs à la truelle dans toute la cave .
narrateur : Ruby lisait la notice .
narrateur : Mathéo lissait les joints .
narrateur : Pico a même fait une chape .
narrateur : Une CHAPE !
narrateur : Suis-je ... fier ?
narrateur : Non ...
narrateur : Pas encore.
narrateur : Mais ému, un peu ...
narrateur : Quand la bombe est tombée, le gaz a frappé un mur si lisse, <>
<>si étanche, <>
<>si solide !
narrateur : Qu'il a rebroussé le chemin .
narrateur : Bon, d’accord ...
narrateur : Pico a cimenté son pied par accident ...
narrateur : Mais dans l’ensemble ?
narrateur : C’est un succès .
narrateur : UNE VRAIE FIN !
narrateur : Pas une bêtise, pas un miracle .
narrateur : Juste ... 
narrateur : Un bon choix .
narrateur : Je vais devoir m’allonger .
narrateur : J’ai besoin de digérer ça ...
narrateur : Félicitation !
}
-> END
{Materiaux == "Gelée":
narrateur : Non mais là je ...
narrateur : Vous allez me dire que j’invente .
narrateur : Ils ont utilisé ...
narrateur : De la gelée .
narrateur : Verte pomme, tramblante et collante ...
narrateur : Ils en ont recouvert les murs et le plafond .
narrateur : Ruby en avait sur ces lunette ...
narrateur : Mathéo ?
narrateur : Il observait son reflet au travers .
narrateur : Pico sautait dedans comme dans une piscine à flan .
narrateur : L’ambiance était à la fête foraine .
narrateur : Et pourtant ...
narrateur : Quand la bombe est tombée ...
narrateur : Le gaz est entré ...
narrateur : Et a ... 
narrateur : Rebondi ?!
narrateur : Je ...
narrateur : Je n’ai aucune explication logique à cela ...
narrateur : Les molécules ont ricoché sur les parois gélifiées comme sur un trampoline .
narrateur : Trois fois ...
narrateur : Résultat ?
narrateur : Trois cochons vivants .
narrateur : Un bunker gluant .
narrateur : Et une odeur de bonbon chimique pour les dix prochaines années ...
narrateur : J’ose à peine le dire ...
narrateur : Grâce à la gelée, ils ont survécu à une attaque chimique ...
narrateur : Félicitations ...
}
-> END
{Materiaux == "SourceOG":
narrateur : Oh, attendez ...
narrateur : C’est ... 
narrateur : Est-ce un hommage ?
narrateur : Non ...
narrateur : Une régression ?
narrateur : Nos trois petits cochons ont ...
narrateur : Reconstruit le conte .
narrateur : Un mur en paille .
narrateur : Un autre en bois .
narrateur : Et le dernier, en brique .
narrateur : Pico a dit : “C’est symbolique !”
narrateur : Ruby : “Si sa marche, je mange mon iPad ...”
narrateur : Mathéo a soufflé dessus, pour "vérifier la solidité" .
narrateur : C'est alors, que le gaz est arrivé .
narrateur : Et là ..., <>
<>mes attentes se sont effondrées ...
narrateur : Pas les murs .
narrateur : Eux, ils ont tenu ...
narrateur : Même la paille, par on ne sait quel miracle à tenue ...
narrateur : Le bois s’est gonflé, comme pour dire “pas aujourd’hui” .
narrateur : Et la brique ?
narrateur : Comme toujours, impeccable .
narrateur : Le gaz n’a rien pu faire .
narrateur : Pas un frisson de jambon à l’horizon .
narrateur : Ils l’ont fait !
narrateur : Ils ont..., <>
<>respecté la tradition .
narrateur : Comme quoi, parfois, pour survivre...
narrateur : Il suffit d’un peu de mémoire .
narrateur : Beaucoup d’huile de coude ...
narrateur : Et un mur de paille bien compressée !
narrateur : Bravo !
narrateur : C’est une fin digne d'un compte !
narrateur : Et pour une fois ..., <>
<>elle ne sent pas le jambon ...
}
-> END
{Materiaux == "Porcium":


A voire

}
-> END

+ [Sortir]
-> ActionPrincipale

+ [Sortir]
-> ActionPrincipale

// Ruelle //

== Antiquaire ==
//~ changeBg ("antiquaire")
//~ show ("antidle")
Antiquaire : Bienvenue dans mon antre, les Chons... 
Antiquaire : Que venez-vous chercher dans ce capharnaüm de trésors oubliés ?
-> entree

= entree
+ [Parler] Avec ?
    ++ [Pico] { PicoDehors == false }
        pico : Tu vends des objets magiques ?
        pico : J’ai besoin de ma dose.
        //~ show ("antasking")
        antiquaire : Hmm… Magique ?
        antiquaire : Pas vraiment… 
        //~ show ("anthappy")
        antiquaire : Mais j’ai cette magnifique chenille en or !
        //~ show ("antidle")
        antiquaire : Parfaite pour les amateurs d’originalité...
        pico : Non, non... 
        pico : J’veux ma *dose*, pas un gadget pour vieux collectionneur.
        //~ show ("antasking")
        antiquaire : Si tu cherches du bizarre, j’ai entendu parler d’une vieille lampe abandonnée dans les ruines.
        //~ show ("antidle")
        antiquaire : Elle aurait un petit air magique.
        -> entree

    ++ [Ruby]
        ruby : Je cherche du matos électronique, t’as ça ?
        //~ show ("antasking")
        antiquaire : Tu crois être chez Darty ici ?
        //~ show ("anthappy")
        antiquaire : Je ne vends que du matériel noble, de l’authentique, de l’unique !
        //~ show ("antidle")
        ruby : Noble ?
        ruby : T’appelles ça noble ? 
        ruby : C’est de la camelote ton bric-à-brac…, même pas un pet de circuit imprimé dans tout le magasin.
        //~ show ("antangry")
        antiquaire : Comment ?!
        antiquaire : Tu insultes ma boutique ?
        ruby : Ton "matériel noble", c’est juste un tas de vieux trucs bons pour le grenier de mémé.
        -> entree

    ++ [Mathéo]
        mathéo : Vous avez des objets vraiment précieux ici ?
        //~ show ("anthappy")
        antiquaire : J’ai de tout !
        //~ show ("antidle")
        antiquaire : Bijoux anciens, meubles rares, objets d’époque… 
        //~ show ("antsad")
        antiquaire : Malheureusement, l’un des plus beaux m’a été volé.
        mathéo : Dis-moi qui l’a volé, je vais lui refaire le portrait.
        //~ show ("antidle")
        antiquaire : Calme-toi.
        antiquaire : C’est mon frère.
        //~ show ("antsad")
        antiquaire : Il squatte devant la boutique et refuse de me rendre ce qu’il m’a pris.
        -> entree

+ [Voler] Avec ?
//~ show ("antidle")
    ++ [Pico] { PicoDehors == false }
        pico : Bon... (j’vais m’faire discret et choper un truc intéressant...)
        //~ hide ("antidle")
        pico : Un lustre vénitien en or massif !
        // Le fait tomber comme un manche.
        //~ show ("antangry")
        antiquaire : TOUCHE PAS À ÇA !!!
        antiquaire : VOLEUR !
        // Ext jeté dehors à coups de pied dans le gras.
        ~ PicoDehors = true
        -> entree

    ++ [Ruby]
        ruby : (Voyons s’il a planqué un vieil ordi ou une puce quelque part...)
        // Fouille méthodiquement.
        ruby : Rien...
        ruby : Nada.
        ruby : Même pas un câble USB!
        ruby : Tout ce matos est dépassé !
        ruby : Ce gars vit dans une autre époque, il pige rien à la vraie tech...
        -> entree

    ** [Mathéo] { Materiaux == "" }
        mathéo : C’est quoi ça ? (une pelote de laine ?)
        mathéo : Ça peut toujours servir...
        mathéo : (Et hope, dans les poche...)
        // La glisse dans son sac en sifflotant.
        ~ Materiaux = "Laine"
        -> entree
        
+ [Parler de la boîte] { connai_boite == true }
    ++ [Pico] { PicoDehors == false }
        pico : J’ai entendu parler d’une boîte...
        pico : Tu saurais où elle est ?
        //~ show ("antasking")
        antiquaire : La boîte à musique ?
        //~ show ("antidle")
        antiquaire : Elle est avec mon frère, le type dans la ruelle.
        //~ show ("antsad")
        antiquaire : Va le voir, mais vas-y mollo, il est déjà assez fêlé.
        //~ show ("antidle")
        -> entree

    ++ [Ruby]
        ruby : Dis, la boîte là !
        ruby : Tu sais, la boîte ! 
        ruby : En bois ! Genre chaudron, mais avec des trucs en fer dessus…
        ruby : Tu vois ?
        //~ show ("antangry")
        antiquaire : Oui, oui...
        //~ show ("antidle")
        antiquaire : Tu parles beaucoup trop (une vrai pille...)
        antiquaire : C'est mon frère dans la ruelle qu'il l'a détient...
        antiquaire : Tiens, prends ça, et va le récupérer...
        antiquaire : Tu veux ?
        // Pésente de l'espèce, des piece qui teinte au choc
        ~ Argent += 1
        //~ show ("anthappy")
        antiquaire : (Bon débarras.)
        //~ show ("antidle")
        antiquaire : (Elle m’aurait tenu la jambe pendant une heure sinon...)
        -> entree

    ++ [Mathéo]
        mathéo : Écoute ma jolie, j’en ai marre de chercher cette boîte.
        mathéo : Tu sais où elle est ou pas ?
        //~ show ("anthappy")
        antiquaire : Aucune idée...
        //~ show ("antidle")
        antiquaire : (Si je lui dit il va le rouer de coup...)
        //~ show ("anthappy")
        antiquaire : Mais regarde cette tondeuse Cochonou de collection plutôt !
        antiquaire : En saphir massif !
        antiquaire : Promo du siècle !
        //~ show ("antidle")
        mathéo : Euche !
        mathéo : Dit Pico on peux l'ache...
        //~ show ("pico")
        pico : Non...
        //~ hide ("pico")
        mathéo : ...
        -> entree

+ [Sortir]
//~ show ("anthappy")
Antiquaire : Au plaisire de vous revoir !
//~ show ("antidle")
-> ActionPrincipale

== Clochard ==
"Texte d'introduction au lieu" {~texte 1|texte 2|texte 3}

+[Discussion] // Discuter/acheter avec le clochard
++ [Pico Chon] // +1 : donne la boîte (de vrai bro)
{->ParleCloclo1|->ParleCloclo2|->ParleCloclo3|->ParleCloclo4}

++ [Ruby Chon]
{ClodoKo == false:
    {Cafeine == false: // Vous tentez une approche, mais sans succès...
    Ruby: Pourquoi {~j’irai lui parler ?|faire ?|insister ?}
    Ruby: Il ne comprendrait pas la moitié de ce que je lui dis.
    Ruby: {~En plus, je n’ai pas assez d’énergie pour ça...|Peut-être qu’avec un café...|Pfff, j’ai besoin d’un remontant...}
    -> Clochard
    }
    {Spray == false:
        {Cafeine == true: // Vous lui apprenez la crypto money ...
        {CryptoMoney == false:
        Ruby: Tu sais que t’as le prérequis pour monter ton empire, là ?
        Clochard: Tu penses parler à qui au juste ?
        Ruby: Je parle de toi.
        Ruby: Avec ce que tu sais faire, tu pourrais vivre de la crypto.
        Clochard: J’ai déjà vécu du yaourt périmé pendant six jours…
        Clochard: On m’impressionne plus avec des mots grecs.
        Ruby: C’est pas grec, c’est numérique.
        Ruby: V I R T U E L …
        Ruby: C’est de l’argent, mais sans pièces, ni billets.
        Clochard: Donc c’est comme les promesses de Bernard, le boulanger.
        Ruby: Non !
        Ruby: C’est fiable, et on appelle ça de la blockchain.
        Clochard: Des chaînes de vélo ?
        Ruby: Pas ce genre de chaîne !
        Ruby: C’est un registre décentralisé.
        Clochard: La seule décentralisation que j’ai connue, c’est quand j’ai dormi entre deux bancs près du parc.
        Ruby: Bon, regarde…
        Ruby: Là, j’ai investi dans une pièce qui s’appelle Pigcoin.
        Clochard: Ouais…
        Clochard : Et ça sert à quoi, ton “Pig-coin” ?
        Ruby : À faire des transactions, acheter, vendre, investir…
        Clochard: Moi j’échange un briquet vide contre une soupe.
        Clochard: T’appelles pas ça une transaction peut-être ?
        Ruby: T’as pas tort, mais c’est là que j’y viens…
        Ruby: Imagine utiliser tes talents de vendeur comme tu le fais à une échelle mondiale.
        Clochard: J’ai même pas de brosse à dents.
        Clochard: Et tu veux que je gère une économie planétaire ?
        Ruby: Si t’as un vieux téléphone, tu peux déjà commencer.
        Clochard : J’en ai un qui vibre sans prévenir…
        Ruby: Ça fera l’affaire…
        Ruby: On va t’ouvrir un portefeuille virtuel.
        Ruby: Et ensuite…
        ~ CryptoMoney = true
        }

        {CryptoMoney == true:
        Ruby: {Alors, ça mine ?|Les blockchain se portent bien ?|T’as besoin de conseil ?}
        Clochard: Ouais, ouais...
        Clochard: {Là, je suis en train de manipuler le commerce...|T’as déjà vu mon dernier NFT "Garbage", il fait un "carton". (littéralement !)|Pas besoin, je suis dans le flux...}
        }
    }
}
    {Spray == true:
    Clochard: {Je veux plus te voir !|Casse-toi !|T’approche pas !}
    }
}
{ClodoKo == true:
Ruby: {~(Il ne risque pas de dire grand-chose...)|(Il est inconscient...)|(Inconsciemment, je me dis que c’est une bonne chose...)}
}
-> Clochard

++ [Mathéo Chon] // se fait insulter par le clochard
{->ParleMath1|->ParleMath2|->ParleMath3|->ParleMath4|->ParleMath5}

+[Attaquer]
++ [Pico Chon] // -1 : il est bourré il lance les bouteilles mais rate comme une merde
// Lance une bouteille, elle casse à côté, bruit de verre cassé
~NBbouteillelancer += 1
{ClodoKo == false:
    {NBbouteillelancer == 1:
    Clochard: T’as essayé de faire quoi là ?
    Pico: D’te donner à boire...
    Clochard: Ho ...
    Clochard: Tu n’étoiras tes cochonneries après hein ?
    Pico: ...
    Clochard: ...
    }
    {NBbouteillelancer >= 2:
    Clochard:{~Tu comptes en lancer encore combien ?|Tu vas me laisser nettoyer à chaque fois ?|Et de {NBbouteillelancer}, tu les sors d’où toutes ces bouteilles ?}
    Pico:{?|??|???}
    }
}
{ClodoKo == true:
    Pico:{?|??|???}
}
-> Clochard

++ [Ruby Chon] // 0 : utilise un spray anti-ours sur le clochard
{Spray == false:
Clochard: Eh bien…
Clochard: Que me vaut cette approche ?
Clochard: Tu veux que je te cagole ma ...?
Ruby: HAAAA M’APPROCHE PAS !
// Coup de spray à Ours pendant 1 min
Clochard: HAAAA !!!
Clochard: Sale petite ***** de ****** !
Clochard: ***** *** ** **** ******* **** !
Ruby:
~Spray = true
- else:
Ruby: Je ne m’approche plus de ce type à moins d’un mètre !
}
-> Clochard

++ [Mathéo Chon] // +1 : lui met un mach punch stabbé à x2 atk dans sa tête
-> MathAttaqueClo

+[Acheter]
-> ClochardBoutique

+[Partir]
clochard: À un de ses quatre !
-> ActionPrincipale

== ClochardBoutique ==
Présentation de son commerce froduleux

[Porkia 33000]
++ [Questionné]
Clochard: Ha ha, je vois que vous avez du groin, Mrs !
Clochard: Cette petite merveille se trouve être un ancien modèle de téléphone très recherché…
Clochard: Son design peut paraître grossier au premier abord, mais je vous garantis que la qualité de ce produit réside ailleurs…
Clochard: Car oui !
Clochard: Plus que pour appeler vos proches, vous pouvez casser des noix avec !
Clochard: DES NOIX !
Clochard: (Voir bien plus d'ailleurs…)
Clochard: Alors ?
Clochard: On fait affaire ?
-> ClochardBoutique
++ [Achat]
~Materiaux = "Porkia33000"
-> ClochardBoutique
++ [Troque]

-> ClochardBoutique
++ [Reposer l'objet]
Clochard: {~Dommage...|Pas à votre goût ?|P’t’être une prochaine fois !}
Clochard: Si vous changez d’avis...
-> ClochardBoutique

+ [C4]
++[Questioné]
Clochard: Ou là!
Clochard: Faite attention avec ce pain…
Mathéo: Du pain?
Mathéo: Il n’est pas très appétissant…
Clochard: Rassurez moi, il n’est pas toujours comme ça…
???: 
???: 
Clochard: Si ?
Clochard: Enfin peu m'importe, cette merveille tout droit sortie de nos frontières, pourrait vous démolir un charre d'assaut, ou bien labourer une parcelle en un temps record !
Clochard: Je vous préviens, je ne suis en aucun cas fautive de vos agissements en ce qui concerne son utilisation !
Clochard: Vous prenez quand même ?
-> ClochardBoutique

++[Achat]

-> ClochardBoutique

++[Troque]

-> ClochardBoutique

++[Reposer l'objet]
Clochard: {~Domage...|Pas à votre goût ?|P't'être une prochaine fois !}
Clochard: Si vous changer d'avis...
-> ClochardBoutique

+ [Chateau la pompe du XVIIème]
{->BouteilDeClo1|->BouteilDeClo2|->BouteilDeClo3|->BouteilDeClo4|->BouteilDeClo5}

+ [Boîte à musique]
++[Questioné]
Clochard: Une très belle pièce, je vous le dit !
Clochard: Je ne saurais pas plus vous informer sur son origine…
Clochard: Mais je croie que sa vient du Perault.
Clochard: C’est une bonne affaire !
-> ClochardBoutique

++[Achat]
~ ActivatePuzzle(true)
-> ClochardBoutique

++[Troque]
Clochard: Pourquoi pas...
{Lampe == true:
Clochard: Je vois que vous aver une très belle lampe !
Clochard: Si vous acceptiez de vous en séparer je...
LeGroupe: Oui !
Clochard: Marché conclue !
~ ActivatePuzzle(true)
-> ClochardBoutique
-else:
Clochard: Par contre je ne voie rien de valeur dans se que vous transporter...
Clochard: Revener me voir si vous trouver quelque chose d'intéressant.
-> ClochardBoutique
}

++[Reposer l'objet]
Clochard: {~Domage...|Pas à votre goût ?|P't'être une prochaine fois !}
Clochard: Si vous changer d'avis...
-> ClochardBoutique

+ [Vous désister]
Clochard: Aucun problème!
Clochard: Je serais toujours ouvert.
-> Clochard

==BouteilDeClo1
Clochard: Cette bouteille ?
Clochard: Désolé, pas à vendre…
Clochard: C’est pour ma consommation personnelle, hé hé…
-> Clochard

==BouteilDeClo2
Clochard: Puisque je vous dis qu’elle est pour moi !
Clochard: C’est si dur à comprendre ?
-> Clochard

==BouteilDeClo3
Clochard: Ok c’est bon…
Clochard: Si vous la voulez tant que ça, va falloir y mettre le prix !
Clochard: Cette bouteille est un précieux millésime que j’ai chour.!.
Clochard: Qui m'a gracieusement été offert par Etchebacon, après lui avoir rendu un très gros service…
Clochard: Alors ?
Clochard: Tu veux toujours l’acheter ?
+[Achat]

-> ClochardBoutique

*[Troque]
Clochard: Non, je ne le troquerait pour rien au monde... (sauf de l'espèce)
-> BouteilDeClo3

+ [Reposer l'objet]
Clochard: Non ?
Clochard: Alors évite de me déranger pour rien...
-> ClochardBoutique

==BouteilDeClo4
Clochard: NON MAIS SÉRIEUX ***** !
Clochard: VOUS AVEZ PAS FINI DE ME FAIR ***** !
Clochard: ACHETER LE QU’ON EN FINISSENT !
+[Achat]

-> ClochardBoutique

*[Troque]
Clochard: JE NE TROQUERAIT RIEN CONTRE !
-> BouteilDeClo4

+ [Reposer l'objet]
Clochard: TU TE DECIDE OUI OU ****** !
-> ClochardBoutique

==BouteilDeClo5
Clochard: ******* DE ******, FINI A LA ****** !
Clochard: ****** *** *** *** *** ****** **** !
Clochard: (Bois la bouteil cul sec)
Clochard: Aher du brais nsgz le kalin ?
Clochard: HEINNNNN !
Clochard: ****** …
// Le clochard s'écroule bouré comme un coin…
Mathéo: 
Ruby: 
Pico: 
-> Clochard

==ParleCloclo1
Pico: T’étais où ce matin ?
Pico: J’t’ai cherché derrière le AuChamp, personne…
Clochard: Trop de passage ce matin.
Clochard: Ici, au moins, j’entends mes pensées.
Pico: Moi, j’ai failli bosser ce matin
Clochard: Toi ?
Pico : Une meuf m’a proposé de l’aide pour un déménagement.
Pico : J’ai dit ouais.
Clochard : Et ?
Pico : Bah j’suis tombé dans ses escaliers avant d’arriver.
Clochard: C’est le destin qui t’a sauvé.
Pico : Ouais… (ou mes lacets.)
Clochard: Moi, j’ai eu une illumination aujourd’hui.
Pico : Dis-moi ?
Clochard : J’ai pensé monter un business de parapluies transparents pour chats d’appartement.
Pico : Attends… quoi ?
Clochard : “Ils ne sortent pas, mais faut les habituer au style de vie.”
Pico: Mais mec… 
Pico: Pourquoi t’es pas millionnaire ?
Clochard : Parce que j’connaissais personne qui avait un chat et un compte en banque.
Pico: T’es trop en avance sur ton temps.
Clochard : Me fait pas rire.
-> Clochard

==ParleCloclo2
Pico: Dit, c’est nouveau ça ?
Clochard : Tu parles de cette boîte à musique ?
Pico : Elle fonctionne ?
Clochard: Pas du tout…
Pico: Tu l’as depuis quand ?
Clochard: Deux jours.
Clochard: Je l’ai trouvée coincée derrière un vieux paravent, près de l'arrière cours d’chez l’antiquaire…
Pico: Comme toi, un peu.
Clochard: Ha ha ha !
Clochard: Elle est bien bonne!
Clochard : Allez tiens.
Pico: Hein ?
Clochard : Prends-la.
Clochard: De toute façon je ne pourrais surement pas la vendre en l’état… (en plus c’est du toc)
Pico: Merci bro!
Clochard: Et si quelqu’un demande d’où elle vient… tu dis que tu l’as trouvée.
~ ActivatePuzzle(true)
-> Clochard

==ParleCloclo3
Pico: T’as eu d’autres trésors comme ça ?
Clochard: J’ai eu une horloge, un jour.
Clochard: Très belle.
Pico: Elle marchait ?
Clochard: Elle courait même!
Mathéo: Sérieux !?!
Clochard: Non…
Clochard: Elle n'avait pas d’aiguilles, mais j’la vendais comme “conceptuelle”.
Pico: T’es un artiste, en fait.
Clochard: Disons que je pourrais te vendre du sable en plein désert !
-> Clochard

==ParleCloclo4
Pico: Un vrai receleur…
Clochard: Tu l'a dit !
Clochard: N’hésite pas à me dire si quelque chose te tape à l'œil…
-> ClochardBoutique

==ParleMath1
Mathéo: Tiens ?
Mathéo: La municipalité n'a pas encore jeté les ordures ?
Clochard: J’ai pas plus bougé que tes deux neurones depuis la maternelle fiston...
Mathéo: Ah ouais !
Mathéo: Hé bien, les poubelles du coin on de la réparti à ce que je voie.
~ColèreClodo += 1
-> Clochard

==ParleMath2
Clochard: Toujours avec ta coupe de cheveux de patron de salle de sport fictive.
Mathéo: J’plais à tout le monde.
Mathéo: Moi !.
Clochard: Tu plais surtout à ton miroir.
Clochard: Et encore, il doit craquer sous la pression.
~ColèreClodo += 1
-> Clochard

==ParleMath3
Mathéo: Tu veux un selfie ou un autographe ?
Clochard: Je veux un miracle !
Clochard: Genre, une minute sans t’entendre !
Mathéo: Je suis ce que t’auras jamais.
Clochard: Ouais… Une tête vide !
Clochard: Avec une merde dessus.
Clochard: !?! …
~ColèreClodo += 1
-> Clochard

==ParleMath4
Mathéo: T’es juste aigri parce que j’ai tout ce que t’as pas.
Clochard: Ouais, t’as raison.
Clochard: J’ai pas ton QI de frigo débranché…
Mathéo: Tu dis ça parce que t’as jamais été à mon niveau.
Clochard: Ton niveau ?
Clochard: IL EST À LA HAUTEUR DU TROTTOIRE TON NIVEAUX !
Clochard: C’EST P'T’ÊTRE POUR ÇA QUE JE TE VOIS SOUVENT !
Mathéo: RETOURNE MANGER DES POUBELLES TOI !
~ColèreClodo += 1
-> Clochard

==ParleMath5
Clochard: TU ME CHERCHE C’EST CA !?!
Clochard: TU ME CHERCHE !?!
Mathéo: OUI !
Clochard: VA Y J’T’ATTEND !
~ColèreClodo += 1
-> MathAttaqueClo

==MathAttaqueClo
{ClodoKo == false:
    {ColèreClodo <= 5:
    Clochard: T’approche pas…
    Clochard: T'APROCHE PAS J’AI DIT !
    Mathéo: Il est grand temps de jeter les ordures !
    - else:
    Clochard: VAS Y !
    Clochard: APPROCHE MON COCHON !
    Mathéo: PAS BESOIN DE ME LE DIRE DEUX FOI! 
    // Mise à tabac
    ~clochardstate = "tabac"
    }
    {ClodoKo == false:
    Clochard: Ghhe, pftu bra’le payer fther…
    Clochard: ***** !
    // S'écroule inconscient
    Mathéo: 
    ~ClodoKo = true
    }
}
{ClodoKo == true:
// Frappe un coup
Mathéo:{Il à déjà eu son compte…|Bon, juste un coup de pied…|C’est drôle en fait !|Un pour Pico…|Un pour Ruby…|Un pour Moi…|Un pour la voisine…|Un pour le chien de la voisine}
    ~NNFrappe += 1
    {NNFrappe >= 10:
    //Au bout de la ??ème fois
    Mathéo: Un pour...
    Pico : C'est bon, STOP!
    Pico : {A force il va devenir bleu !|C'est pas un sac de frappe !|La bombe finira le travaille...}
    Ruby : Apprès, il l'avait un peux chercher...
    }
}
-> Clochard

== Ruine ==

+ [Fouiller les ruines] Avec ?
    ++ [Pico] 
        {LivreComptes == false:
            pico : Hoho !
            pico : Mais c’est la planque du clodo, ça.
            pico : (Y une bouteille à moitié pleine !)
            // *glou glou glou*
            pico : Ahhh...
            pico : Ca c’est de l’essence de bonheur...
            pico : Mmm ? 
            pico : C’est quoi ce vieux machin moisi ?
            pico : “L’enfance des trois petits cochons”... ?
            // *feuillte les pages*
            pico : Trop chelou l'histoire !
            pico : Mais c'est remplie d'indique pour survivre...
            pico : Je prend, si sa àn marcher pour eux...
            pico : Sa devrai marcher pour nous aussi !
            ~ NbAlchool += 1
            ~ LivreComptes = true
        - else:
            pico : C’est bon, j’ai déjà vidé le mini-bar et pris le bouquin.
            pico : Plus rien ici à part des camlots.
        }
    -> Ruine

    ++ [Ruby] 
        {NoGlasse == false:
            ruby : Doit bien y avoir des objets électroniques cassés que je peux récupérer ici…
            // *avance prudemment… glisse sur une brique*
            ruby : OAAAHHH !
            // *s’écrase au sol, bruit de plastique qui craque*
            ruby : … oh non…
            ruby : MES LUNETTES !
            ruby : Super… me voilà en 144p…
            matheo : Bouffonne !
            ruby : ...En vrai bien vu .
            ~ NoGlasse = true
        - else:
            ruby : J’ai déjà tout fouillé.
            ruby : Et mes lunettes sont toujours mortes.
        }
    -> Ruine

    ++ [Mathéo] 
        {SacCiment == false:
            matheo : Hmm…
            matheo : Un sac ?
            matheo : Ah ouais, du ciment !
            matheo : Parfait pour entrainer les dorceaux
            ruby : Ou construire un abrie ... (banane !)
            matheo : J’le garde .
            ~ SacCiment = true
            ~ Materiaux += "Ciment"
        - else:
            matheo : Rien d’autre à foutre ici à part jongler avec les décombres...
        }
    -> Ruine

+ [Ouvrir la porte]
    {porteOuverte == false:
        ++ [Pico]
        {C4 == true:
            pico: Hmm… 
            pico: Cette porte a pas l’air très fan des visites.
            pico: On va lui faire une petite surprise.
            // *sort son C4, colle ça au mur comme un chef*
            pico: FIRE IN THE HOLE !
            // *explosion sourde – le mur s’écroule*
            pico: Le mur est mort, mais la porte est intacte.
            ruby: Y a que la porte qui est intacte gros malin...
            pico: Hehem, je ...
            pico: Je prends la porte !
            pico: Voilà quelque chose qui pourait résister à n'importe quel choc !
            ~ porteOuverte = true
            ~ Materiaux += "Porte"
        - else:
            pico: Cette porte est plus têtue qu’un cochon à jeun…
            pico: Si je picole un peu, j’pourrais peut-être oublier qu'elle est fermé ?
        }
        -> Ruine
        
        ++ [Ruby]
        {IPad == true:
            ruby: Une porte blindée ?
            ruby : Rien qu’un bon gros hack ne peut pas ouvrir.
            // *sors son iPad, pianote avec détermination*
            pico: (Elle est sérieuse ?)
            pico: Y a même pas de véroue électromachin truc sur ta porte...
            ruby: Chuuut.
            // *la porte claque soudainement… et s’ouvre lentement*
            pico: (Elle …)
            pico: (Elle a réussi !?!)
            pico: Mais comment tu ...
            ruby: Bien sûr que j’ai réussi !
            ruby: Ayez foi en la tech, paysans .
            pico: ...
            ~ porteOuverte = true
            ~ Lampe = true
        - else:
            ruby : Une porte blindée ?
            ruby : Avec un bon hack, mais j’ai oublié mon iPad.
            ruby : Super ...
        }
        -> Ruine
        
        ++ [Mathéo]
        {RedPig == true:
            matheo : Cette porte fait trop la fière !
            matheo : Je vaislui montrer se que vaux le grand Mathéo, après avoir charger les batteries !
            matheo : YAAAAAH !
            // *fonce sur la porte à pleine puissance*
            // *le battant vibre, puis cède dans un grand fracas métallique*
            matheo : C’est qui le patron ?
            matheo : Hmm ?
            matheo : Une lampe ?
            matheo : Je prend .
            ~ porteOuverte = true
            ~ Lampe = true
        -else:
            matheo : Je vais l’ouvrir à l’ancienne...
            // *Choc violament sourd*
            matheo : ...ou pas .
            matheo : J’suis trop à sec .
            matheo : Avec une Red Pig, j’lui explose les gonds, c'est sûr !
        }
        -> Ruine
    }
 ruby: La porte est déjà ouverte .
 ruby: Faut suivre un peu ...
 -> Ruine
 
+ [Sortir des ruines]
-> ActionPrincipale

== Puit ==

{PlusDSaut == false:
+ [Prendre de l'eau]
    ++ [Pico]
        pico: (On va chercher l’eau tranquillement...)
        // remonte le seau*
        pico: Et voilà ! 
        mathéo: rien d'étrande ?
        pico: Non...
        pico: Tu t'attendais à quoi ?
        ~ Eau = true
        -> Puit

    ++ [Ruby]
        ruby: Récupérer de l’eau ? (Easy!)
        // *envoie le seau au fond*
        ruby: Et beh il est profond...
        ruby: Allez !
        // *rougit, force, s’écroule*
        ruby: FUTAIN DE MERLE !
        mathéo: Bouffonne.
        ruby: Vas-y, essaye pour voir ?
        -> Puit

    ++ [Mathéo]
        mathéo: (OK let's go, comme à la salle...)
        // *tire d’un coup sec, le seau s’envole, disparaît dans les airs*
        mathéo: Euh... j'ai peut-être tiré un peu fort.
        ruby: Braveau !
        ruby: On fait comment maintenant ?
        ~ PlusDSaut = true
        -> Puit
}
+ [Parler au puits]

    { picoDansPuits && rubyDansPuits && mathéoDansPuits:
        ++ [Pico]
            pico: Super, on est trois ! 
            pico: C’est le puits-party !
            puits: C’était mieux quand j’étais seul !...
            -> Puit

        ++ [Ruby]
            pico: (Bon, autant y aller à la force maintenant...)
            pico: Donne ta main, Mathéo !
            mathéo: YAAAAAAAA ! Allez, à toi Ruby !
            ruby: J'arrive...
            pico: Mathéo, ne recommence plus ça, compris ?
            pico: Ta bétise nous aura fais paumer un paquet de temps !
            mathéo: Mais oui, mais oui...
            puits: Vous avez pas oublier quelqu’un ?
            pico: ...
            mathéo: ...
            ruby: ...
            ~ picoDansPuits = false
            ~ rubyDansPuits = false
            ~ mathéoDansPuits = false
            -> Puit

        ++ [Mathéo]
            mathéo: On va s’en sortir, allez, tous ensemble !
            puits: Vous êtes lourds...
            puits: LOURDS !
            -> Puit
    }

    { picoDansPuits && rubyDansPuits && !mathéoDansPuits:
        ++ [Pico]
            pico: MATHÉO GROS BÂTARD !
            pico: REMONTE-NOUS !
            puits: Il a l’air d’être du genre à "agire avant de réfléchir", non ?
            -> Puit

        ++ [Ruby]
            ruby: MATHÉO ! 
            ruby: AIDE-NOUS À SORTIR D’ICI TOUT E SUITE !
            puits: Vous êtes deux maintenant ?!
            puits: C’est pas une colocation ici...
            -> Puit

        ++ [Mathéo]
            mathéo: Allez, j’vous remonte...
            // *force un peu trop*
            mathéo: AAAAAAH !!
            // *Plouf*
            puits: On est un quatuor maintenant ! (Misère...)
            ~ mathéoDansPuits = true
            -> Puit
    }

    { picoDansPuits && !rubyDansPuits && !mathéoDansPuits:
        ++ [Pico]
            pico: Remontez-moi, bordel !
            pico: Y’a un gars chelou ici !
            puits: J’préfère "personne mystérieuse", merci.
            -> Puit

        ++ [Ruby]
            ruby: Pico ?!
            pico: Remonte-moi ! 
            pico: J’suis pas une truite !
            puits: Elle a l’air plus fiable que toi, ça me rassure.
            ruby: Mathéo, aide-le !
            mathéo: Demande le moi plus gentillement, merci !
            puits: Ha ...
            ruby: Mais quesque tu .?!
            ruby: Haaaa !
            // *Plouf*
            ~ rubyDansPuits = true
            -> Puit

        ++ [Mathéo]
            pico: Va te faire foutre et aide-moi !
            mathéo: Hahahaha !
            mathéo: Grosse merde, ahahahah !
            puits: Ce lien fraternel est très... 
            pico: Bancale... ?
            puits: Touchant !
            puits: J'allais dire touchant...
            -> Puit
    }

    { connaissentPuits && !picoDansPuits :
        ++ [Pico]
            pico: T’as de l’alcool là-dedans ?
            puits: Que du désespoir et des souvenirs d’enfance.
            pico: Pff... 
            pico: Un Ricard aurait été plus utile !
            -> Puit

        ++ [Ruby]
            ruby: C’est qui là-dedans ?
            puits: Un cochon... un écho... un regret.
            ruby: T’es pas un peu drama sur les bords toi ?
            -> Puit

        ++ [Mathéo]
            mathéo: Tu veux sortir ?
            puits: Évidemment !
            mathéo: Et moi j’veux une Switch !
            mathéo: On a tous des rêves.
            puits: Toi, t’es pire que mon karma...
            -> Puit
    }

    { picoDansPuits == false && !connaissentPuits:
        ++ [Pico]
            pico: Oh, t’as soif, le puits ?
            puits: Si c'est pas de l'eau, ouais, donne un peu !
            pico: Tiens atra...
            // *plouf*
            puits: Hah !
            puits: Un nouveau colocataire !
            ~ picoDansPuits = true
            ~ connaissentPuits = true
            -> Puit

        ++ [Ruby]
            puits: Hé, pssst ...
            ruby: (J’entends... une voix ?)
            puits: Tu mentend ?
            ruby: C’est quoi ce délire...
            puits: Tu peut aussi me parler si tu veux ?
            ruby: !?!
            ~ connaissentPuits = true
            -> Puit

        ++ [Mathéo]
            mathéo: Salut, ça va ?
            puits: Ça va... ça va... ça va...
            mathéo: (On dirait un vieux sénile de 67 ans en conflit avec l’Urssaf.)
            puits: Que...
            puits: Tu serais pas mon ex-beau-fils ?
            ~ connaissentPuits = true
            -> Puit
    }
    
{C4 == true:
+ [Faire exploser le puits]
    
        ++ [Pico]
            pico: J’en ai marre de réfléchir.
            pico: On l'explose.
            // pose le C4*
            puits: Attends !!!
            puits: T’as pas réfléchi au...
            // *BOOOOOM*
            pico: Voilà !
            pico: Puits, t’es sauvé ou t’es mort, on verra bien.
            pico: J'y pense !
            pico: On pourait utiliser les débris !
            pico: Y a des cristeaux chelou qui en sont sortie...
            ~ C4 = false
            ~ Materiaux = "Porcium"
            -> Puit

        ++ [Ruby]
            ruby: Pico vient de... mais il est con ou... ?
            // *BOOM*
            puits: AAAH mes articulations !
            ruby: Miskine...
            pico: Voilà !
            pico: Puits, t’es sauvé ou t’es mort, on verra bi...
            ruby: T'EST UN PUTAIN D'INCONCIENT PICO !
            pico: Ouais c'est ça...
            pico: Regarde plus tôt !
            pico: Y a des cristeaux chelou qui en sont sortie...
            ~ C4 = false
            ~ Materiaux = "Porcium"
            -> Puit

        ++ [Mathéo]
            mathéo: T’es vraiment un débile profond mec ...
            pico: De quoi tu me parle ?
            pico: T'a une autre idée ?
            mathéo:Non ...
            pico: Bah voilà !
            puits: J’vous déteste ...
            // *BOOM*
            ruby: (On a détruit le patrimoine local...)
            mathéo: Cool ...
            mathéo: Regarde Pico !
            mathéo: Y a des cailloux partout maintenant ...
            pico: Sa peut surement servir pour la cave !
            pico: Prend les .
            ~ C4 = false
            ~ Materiaux = "Porcium"
            -> Puit
}

== Mairie ==
//~ changeBg ("mairie")
//~ show ("daridle")
darone : Ah tiens, vous êtes venus faire les imbéciles ici maintenant ?

-> mairie_menu

= mairie_menu

+ [Parler à la secrétaire]
    ++ [Pico]
        pico : Bonjour, je viens faire une petite formalité.
        secretaire : Oui ? ...
        pico : J’aimerais faire un prêt de 1 milliard de hoats s’il vous plaît.
        secretaire : ...Ceci est une mairie, pas une banque.
        secretaire : Quand bien même..., vous n’avez pas l’air solvable.
        pico : Vous allez me le faire ce prêt ou je vais porter plainte !
        secretaire : Vous pouvez aussi sortir discrètement par la gauche avant que j'appelle la sécurité...
        pico : Hmmm...
        pico : Je reviendrai avec un avocat !
        secretaire : sécurité...
        pico : Ok, ok...
        -> mairie_menu

    ++ [Ruby]
        ruby : Bonjour !
        ruby : J’aimerais changer un truc hyper important.
        secretaire : Une adresse ?
        secretaire : Un état civil ?
        ruby : Non, mon blaze.
        ruby : “Ruby”, c’est dépassé.
        ruby : Appelez-moi "Xx_Dark_Wolf_Killer_69_xX".
        secretaire : …Très bien. (Les jeunes...)
        secretaire : “Xx_Dark_Wolf_Killer_69_xX” ...
        secretaire : Vous signez ici, là…
        secretaire : Et là..., voilà !
        ruby : Trop stylé.
        ~ ruby_nom = "Xx_Dark_Wolf_Killer_69_xX"
        -> mairie_menu

    ++ [Mathéo]
    { Expulsion == true :
        mathéo : Madame la secrétaire.
        mathéo : J’aimerais lancer une procédure d’expulsion contre un indésirable.
        secretaire : Quel est le motif de la demande ?
        mathéo : Il sent mauvais.
        mathéo : Il regarde bizarrement.
        mathéo : Et il squate les voies publiques.
        secretaire : ...Je note.
        ~ Expulsion = true
    - else :
        secretaire : Autre chose ?
        mathéo : Non, c'est bon .
    }
    -> mairie_menu

+ [Parler à leur mère]
    ** [Pico]
        pico : Bonjour maman !
        //~ show ("darangry")
        darone : PICO !!!
        darone : Tu pue l'alcool !
        darone : T’es encore torché ?!
        darone : Je t’ai dit de pas traîner avec ta fratrie si tu bois comme un tonneau !
        pico : C’est bon Maman...
        //~ show ("daridle")
        darone : Bon...
        darone : Qu’est-ce que vous voulez encore ?
        pico : Tu n'aurais pas la clé de la cave ?
        //~ show ("darangry")
        darone : Non, et même si je l'avais, je ne te la donnerais pas !
        pico : Maman, c'est pour notre survie !
        darone : C'est sutout pour tout siffler !
        //~ show ("daridle")
        darone : C'est bien pour toi que je l'ais fermer à clé .
        -> mairie_menu

    ++ [Ruby]
        ruby : Maman, c’est grave !
        ruby : Y’a une BOMBE qui va tomber sur le village !
        ruby : On a besoin de la cave, tout de suite !!
        darone : Oh Ruby, quelle surprise de te voir bouger pour autre chose que ton <>
        //~ show ("darangry")
        darone : <> PC !
        //~ show ("daridle")
        darone : …La cave ? 
        darone : Ça fait un moment que j’ai perdue la clé...
        //~ show ("darasking")
        darone : Il me semble qu’elle était dans une boîte à musique…
        darone : Mais je l’ai vendue à l'antiquaire ou un collectionneur, je sais plus...
        //~ show ("daridle")
        ruby : Super ! 
        ruby : Donc on doit retrouver une boîte random !
        ruby : Vendue à un random !
        ruby : Dans un lieu random !
        ruby : J’espère qu’elle est pas gardée par un SDF ou un mec débile ...
        ~ connai_boite = true
        -> mairie_menu

    ++ [Mathéo]
        mathéo : M’man… t’as la clé de la cave ?
        //~ show ("daridle")
        darone : Non .
        mathéo : …Ok .
        -> mairie_menu
        
{ voiture_accident == false:
+ [Voler la voiture du maire]
    ++ [Pico] 
        pico : Héhé, opération "Grand Tour" commence !
        // *Titube jusqu’à la voiture, entre par effraction*
        pico : C’est ouvert !
        pico : Alors, ou est le démareur ...
        // Bruit de moteur. Puis… *CRAAAAAASH*
        pico : WOUHOUU—OUPS.
        darone : C’ÉTAIT QUOI !?!
        darone : LA VOITURE DU MAIRE !
        darone : PICO !!!
        secretaire : …Et voilà. Encore un rapport à rédiger.
        ~ voiture_accident = true
        -> mairie_menu

    ++ [Ruby]
        ruby : Je vais m’y prendre comme d’habitude…
        ruby : *Connecte son téléphone au tableau de bord via une appli douteuse*
        ruby : Et... BINGO, accès obtenu !
        ruby : *Monte, regarde les pédales, panique un peu*
        ruby : ... Je sais pas conduire, en fait.
        mathéo : Bou—
        ruby : NON.
        mathéo : —fonne !
        ruby : *Soupir exaspéré, descend et claque la porte*
        secretaire : Veuillez ne pas forcer les véhicules de fonction, merci.
        -> mairie_menu

    ++ [Mathéo] 
        mathéo : Voyons voir cette belle bagnole.
        mathéo : *Essaie d’ouvrir la portière, mais l’arrache complètement*
        mathéo : Oups.
        mathéo : Bon, au moins j’ai du bon métal là-dedans.
        mathéo : “CochoMobile” en matériaux, validé !
        secretaire : Monsieur ?! Vous... vous avez VOLÉ une portière ?
        mathéo : Je préfère dire “prélevé une ressource”.
        ~ voiture_accident = true
        ~ Materiaux = "CochoMobile"
        -> mairie_menu
}  

+ [Sortir]
//~ show ("daridle")
darone : Faites pas trop les cons dehors !
secretaire : Revenez quand vous voulez (mais pas trop souvent ...)
-> ActionPrincipale

== AuChamp ==
//~ changeBg ("auchamp")
//~ show ("pieridle")
+ [Parler à Pierre]
    ++ [Pico]
    pico: Salut Pierre, ta des six packs en stock ?
   //~ show ("pierhappy")
    pierre: Évidemment !
    //~ show ("pieridle")
    pierre: Chez moi, c’est XXL ou rien.
    pico: J’te kiffe.

    -> AuChamp

    ++ [Ruby]
    ruby: Euh... salut… (C’est quoi cette tête de fou malade ?)
    //~ show ("pierhappy")
    pierre: Bien le bonjour babygirl .
    pierre: (Est-ce que ton père travaille chez Nintendo ?)
    pierre: (Parce que t’es une DéeSse.)
    //~ show ("pierasking")
    pierre: Rouge Rubis...
    ruby: ?!
    pierre: Ton père a volé tous les rubis de la grotte pour les mettre in your eyes...
    // *insère tout le poème complet ici...*
    ruby: (Je vais exploser de gêne...)
    ~ Materiaux = "Rigolofleur"

    -> AuChamp

    ++ [Mathéo]
    mathéo: Dit donc m’sieur vous êtes tarpin grand. Vous devez avoir une génétique de fou furieux pour la salle.
    //~ show ("pierhappy")
    pierre: Haha ouais, je peux te soulever carrément tu connais.
    mathéo: Ah ouais... ça vie ici.

    -> AuChamp

+ [Explorer le magasin]
    ** [Pico]
    pico: C’est moi ou il y a une promo sur tout ce qui sert à rien ?
    pico: OOOOH ils ont des Boom Box !
    pico: JE VAIS FAIRE LE MUR DU SON !
    pico: Ruby !!
    pico: C’est moi qui vais avoir la place du génie maintenant !
    ruby: (Normalement je devrais être exténuée par cette idée, mais pourquoi pas lui faire confiance...)
    ruby: C'est super !
    ruby: Bien jouer...
    ~ Materiaux = "Enceinte"
    -> AuChamp

    ++ [Ruby]
    ruby: (Je sais pas si Pierre va se dire à un moment que je me suis rendu compte qu’il me regarde en se cachant derrière les rayons...)
    ruby: (Il me met trop mal à l’aise...)
    ruby: (J’arrive pas à me concentrer.)
    //~ show ("pieridle")
    pierre: (Elle m’a toujours pas remarqué... héhé...)
    -> AuChamp

    ++ [Mathéo]
    mathéo: ...
    mathéo: Cette pubs... (trop hypnotisantes...)
    ruby: (Il est resté bloqué sur un écran figé pendant plus de 10 minutes...)
    ruby: C’est grave...
    pico: Tu la dit...
    -> AuChamp

+ [Fouiller le bureau de Pierre]
    ++ [Pico]
    pico: Ohoh... 
    pico: Y'a un tiroir là !
    // *cling cling*... *bam*
    //~ show ("pierasking")
    pierre: Qu’est-ce tu fous là !?
    pico: Euuuuh... 
    pico: j’me suis perdu ?
    //~ show ("pieridle")
    pierre: Dégage de là, ta rien à faire ici ...
    -> AuChamp

    ++ [Ruby]
    ruby: Voyons voir… 
    ruby: C'est son ordi ? (Un peu viellot, mais c'est dans mes corde !)
    ruby: Voyon voir...
    // pianote sur le clavier
    ruby: Voilà, qu’est-ce que vous feriez sans mes talents de hackeuse professionnelle !
    ruby: Oh non... (je m’en doutais TELEMENT pas ...)
    ruby: Pierre est un loup .
    mathéo: Un loup ?
    ruby: Oui, un loup espion...
    pico:  Comme papa .
    mathéo: Sa explique ça carure de BG ...
    ruby: C’est pour ça qu’il me tourne autour ? 
    ruby: Il veut me croquer !
    mathéo: Mais... 
    mathéo: Il ressemble pas à un loup, si ?
    ruby: ...
    pico: ...
    -> AuChamp

    ++ [Mathéo]
    mathéo: Hmm... 
    // cling cling, bruit de pièces
    //~ show ("pierasking")
    pierre: Qu’est-ce que tu cherche là !?
    mathéo: Je... je... 
    mathéo: Le secret de ta force ?
    //~ show ("pieridle")
    pierre: Tu est sérieux ?
    mathéo: Oui ?
    //~ show ("piersad")
    pierre: (Il est sérieux...) 
    //~ show ("pieridle")
    pierre: C'est pas là que tu aura ta réponsse...
    pierre: Sort...
    -> AuChamp

+ [Sortir]
-> ActionPrincipale

== Restaurant ==
//~ changeBg ("restaurant")
//~ show ("chefidle")
"Texte d'introduction au restaurant" {~texte 1|texte 2|texte 3}
+ [Parler]
    ++ [Pico]
    chef: Bonjour mon grand !
    chef: Qu’est-ce qui t'amène ici ?
    //~ show ("chefhappy")
    chef: Tu viens parler cuisine avec moi ?
    //~ show ("chefidle")
    pico: Parler cuisine ?
    pico: J’adore cuisiner et boire moi ! 
    pico: Surtout boire !
    //~ show ("chefhappy")
    chef: Super alors ! 
    chef: Ça te dirait de cuisiner avec moi ?
    pico: J’ai trop faim, je veux bien !
    //~ show ("chefidle")
    chef: Très bien alors ! 
    //~ show ("chefasking")
    chef: C’est une recette un peu expérimentale à base de gelée, jamais essayé...
    //~ show ("chefhappy")
    chef: Mais ça va faire un carton dans mon restaurant !
    pico: Y aura de l’alcool dedans ?
    //~ show ("chefidle")
    chef: J’en sais rien, on verra !
    // CUISINE TIME !
    //~ show ("chefhappy")
    chef: Et voilà le travail !
    //~ show ("chefidle")
    chef: Qu'en penses-tu ?
    pico: C’est... gluant...
    pico: Sans vraiment de goût...
    pico: Et encore moins d’alcool !
    //~ show ("chefasking")
    chef: Vraiment ?
    //~ show ("chefsad")
    chef: Bon, j’en referai pas...
    //~ show ("chefhappy")
    chef: Mais au moins, j’aurai essayé !
    pico: Et le reste de gelée ?
    //~ show ("chefidle")
    chef: Tu sais quoi ?
    //~ show ("chefhappy")
    chef: Je te le donne.
    //~ show ("chefidle")
    chef: Ça me sert plus à rien !
    pico: Merci Chef !
    ~ Materiaux = "Gelée"
    -> Restaurant
    
    ++ [Ruby] 
    { RubyDehors == false:
    chef: Bonjour ma grande !
    chef: Qu’est-ce qui t’amène ici ?
    //~ show ("chefhappy")
    chef: Tu viens parler cuisine avec moi ?
    //~ show ("chefidle")
    ruby: nn je cuisine pas
    chef: Tu ne cuisines pas ?!
    //~ show ("chefasking")
    chef: Mais comment tu fais pour te nourrir ?
    ruby: Pastabox ! hihihihi
    //~ show ("chefidle")
    chef: Des nouilles instantanées ?!
    //~ show ("chefangry")
    chef: TU TE MOQUES DE MOI ?!
    ruby: c’est très bon, tg !
    chef: TU N’AS AUCUN GOÛT !
    chef: HORS DE MA VUE !
    ruby: oe
    ~RubyDehors = true 
    -else:
    //~ show ("chefangry")
    chef: {~ENCORE TOI ?!|JE T'AVAIS DIT DE NE PAS REVENIR !|DÉGUERPIS !}
    // Claque la porte violament
    }
    -> Restaurant

    ++ [Mathéo]
    //~ show ("chefhappy")
    chef: Ah Mathéo, comment ça va ?
    //~ show ("chefidle")
    chef: Tu ne travailles pas aujourd’hui pourtant ?
    chef: Tu viens faire des heures sup ?
    mathéo: jsp, j’accompagne mon frère et ma sœur au restaurant
    //~ show ("chefhappy")
    chef: Dit-leur de venir me voir !
    //~ show ("chefidle")
    chef: Je suis sûr qu’on pourrait bien s’entendre !
    -> Restaurant

* [Commander à boire]
    ++ [Pico]
    pico: Je voudrais du Pastis pour nous trois, c’est ma tournée !
    //~ show ("chefhappy")
    chef: Très bien, 3 pastis pour la 8 !
    //~ hide ("chefhappy")
    // ILS ONT SERVI LE TRUC
    pico: Super ! (Cul sec !)
    ruby: Wow, il est fort cet alcool...
    mathéo: Eeuuurrrk c’est pas bon 
    // il recrache sur Ruby
    ruby: HE!
    ruby: Tu nous fais quoi là ?!
    mathéo: Hahahaha !
    ruby: J'en est partout !
    ruby: Nique ta mère fjeuzfphnuezdnjierjiee...
    mathéo: C'est la tiène aussi !
    ruby: Je ...
    mathéo: Bouffone...
    ~NbAlchool += 1
    -> Restaurant
    
    ++ [Ruby]
    { RubyDehors == false:
    ruby: Café, café! ouh ouh ouh...
    chef: Du café ?
    //~ show ("chefasking")
    chef: Mais vous n’avez même pas pris de repas...
    ruby: Oe .
    //~ show ("chefidle")
    chef: Très bien..., 3 cafés pour la 8 !
    //~ hide ("chefidle")
    // ILS ONT SERVI LE TRUC
    pico: Je passe mon toure...
    pico: C'est pas ma came.
    mathéo: Eeuuuk, c’est trop amer... 
    ruby: Vous ne buvez pas ?
    pico: Non, je passe mon tours.
    mathéo: Plus jamais...
    ruby: Super, plus pour moi !
    pico: Arrète on sait tous comment réagie avec trop de caféi...
    mathéo: Trop tard, elle à tout siffler...
    ~Cafeine = true
    -else:
    //~ show ("chefangry")
    Chef: {~ENCORE TOI ?!|JE T'AVAIS DIT DE NE PAS REVENIR !|DÉGUERPIS !}
    // Claque la porte violament
    }
    -> Restaurant
        
    ++ [Mathéo]
    //~ show ("chefhappy")
    chef: Ah Mathéo, tu viens te restaurer ?
    mathéo: Nan, j’veux juste à boire.
    //~ show ("chefidle")
    chef: Même pas un apéro ?
    mathéo: Nn, tu me connais...
    chef: Très bien, 3 boissons énergisantes pour la 8 !
    //~ hide ("chefidle")
    // ILS ONT SERVI LE TRUC
    pico: C'est pas mauvais, mais c'est pas alcooliser...
    ruby: C'est épais comme de la soupe...
    ruby: (Je préfèrait plus siroté un café bien NOIR !)
    mathéo: HaaaAA ! 
    mathéo: Je me sent revigoré.
    mathéo: Je pourrais faire du déveloper avec un semiremorque !
    ruby: (Pt'être pas quand même...)
    ~BoissEnergique = true
    -> Restaurant

+ [Rendre service]
    ** [Pico]
    pico: Bonjour m’sieur !
    chef: Tu as besoin de quelque chose ?
    pico: J’ai besoin d’argent, l’alcool me coûte cher…
    //~ show ("chefhappy")
    chef: Ah, tu veux bosser ?
    //~ show ("chefidle")
    chef: File en cuisine, j’ai besoin d’aide !
    // ILS ONT CUISINÉ
    //~ show ("chefhappy")
    chef: Merci pour ton aide, se sera tout pour aujourd'hui.
    //~ show ("chefidle")
    chef: Voilà ta paye "avec un suplément" !
    pico: À moi l’alcool !
    ~Argent += 1
    ~NbAlchool += 1
    -> Restaurant
        
    ++ [Ruby]
    { RubyDehors == false:
    ruby: Bonjour monsieur!
    chef: bonjour ma grande, tu cherche quelque chose ?
    ruby: Ouais, des finances.
    chef: Tu veux du travail ?
    //~ show ("chefhappy")
    chef: T’as qu'à m'aider en cuisine dans ce cas !
    //~ show ("chefidle")
    chef: On a toujours besoin de personne en plus .
    ruby: Chiant...
    ruby: Je cuisine pas moi, les seuls truc que je cook c’est avec mon winrate.
    chef: Tu ne cuisine pas ??? 
    //~ show ("chefasking")
    chef: Mais comment tu fais pour te nourrir ?
    ruby: Pastabox !
    //~ show ("chefidle")
    chef: Des nouilles instantanées ?... 
    //~ show ("chefangry")
    chef: DES NOUILLES INSTANTANÉ !
    chef: TU ME PREND POUR UN JAMBON ?!
    ruby: Mais tg, c'est très bon les pastabox !
    chef: AUCUN GOÛT !
    chef: TU NE COMPREND DONC PAS CE QU'EST LA CUISINE !
    chef: HORS DE MA VUE, SINON CA VA MAL FINIR POUR TOI !!!
    ruby: C’est toi qui n'a pas de goût!
    ~RubyDehors = true 
    -else:
    //~ show ("chefangry")
    Chef: {~ENCORE TOI ?!|JE T'AVAIS DIT DE NE PAS REVENIR !|DÉGUERPIS !}
    // Claque la porte violament
    }
    -> Restaurant
        
    ++ [Mathéo]
    mathéo: Salut Chef !
    //~ show ("chefhappy")
    chef: Ah Mathéo !
    //~ show ("chefidle")
    chef: Tu veux aider en salle ?
    mathéo: Oe .
    //~ show ("chefhappy")
    chef: Génial !
    chef: Mets-toi en tenue, hop hop hop !
    // IL A TRAVAILLÉ
    //~ show ("chefidle")
    chef: Merci ! Voilà ta paye !
    ~Argent += 1
    -> Restaurant

== GroinMerlin ==
//~ changeBg ("groinmerlin")
//~ show ("pamidle")

{ Bois == true && Brique == true && Paille == true:
+ [Payer]
pamela: C'est se que vous cherchiez ?
pico: Oui !
pamela: Donc sa nous fait un totale de...
//~ show ("pamhappy")
pamela: 36,45 Hauts.
    {Argent >= 3: 
    pamela: Merci pour votre achat, et ne revenez pas !
    pico: C'est bon...
    ~ Materiaux = "SourceOG"
    ~ Bois = false
    ~ Brique = false
    ~ Paille = false
    - else:
    pico: Tu prend les payments en plusieur foie ?
    pamela: Désoler se n'est pas dans les habitude de la boutique.
    //~ show ("pamangry")
    pamela: Alors veuiller reposer vos achats et disparaitre de ma vue !
    }
pico: Pas besoin d'être aussi directe !
ruby: De toute façon, il n'y avait pas de rayon électronique...
//~ show ("pamidle")
pamela: Mathéo !
mathéo: Quoi ?
//~ show ("pamlove")
pamela: Toi, tu sera toujours le bien venue...
-> GroinMerlin
}

+ [Parler avec la vendeuse]
    ++ [Pico]
        //~ show ("pamidle")
        pamela: Je peux vous aider ?
        pico: Ces perceuses font du bruit...
        pico: Elles me parlent.
        //~ show ("pamsad")
        pamela: Je n’ai pas signé pour ça.

        -> GroinMerlin

    ++ [Ruby]
        //~ show ("pamidle")
        pamela: Bonjour, je peux vous aider ?
        ruby: Vous avez des RTX 4090 ?
        //~ show ("pamasking")
        pamela: C’est LeGroinMerlin ici, pas Cyberland.
        ruby: Pff, scandale !
        ruby: Vendez des clous et taisez-vous.
        //~ show ("pamangry")
        pamela: Vous pouvez aussi sortir.

        -> GroinMerlin

    ++ [Mathéo]
        //~ show ("pamidle")
        pamela: Je peux t'aider ?
        mathéo: Si t’étais une brique, je te poserais au sommet de ma maison.
        //~ show ("pamasking")
        pamela: Euh... 
        pamela: c’est gênant ou mignon ?
        mathéo: Les deux.
        //~ show ("pamlove")

        -> GroinMerlin

+ [Aller dans les rayons]
    
    ++ [Pico]
        pico: J’ai trouvé un truc qui mousse !
        ruby: !?!
        pico: Sa sort toute seule...
        mathéo: Ça bulle, ça mousse...
        pico: On dirais une peinte magic !
        mathéo: Soiré mousse !
        //~ show ("pamangry")
        pamela: Arrêtez de déteriorer tout ce que vous touchez !
        -> GroinMerlin

    ++ [Ruby]
        ruby: Ce lave-linge pourrait faire tourner Minecraft...
        ruby: (Voyon voire...)
        ruby: ... 
        ruby: Zut !
        // La machine s’envole
        mathéo: T’as pété le plafond, meuf.
        ruby: La vendeuse va me saucisser c’est sûr !
        mathéo: Bouffonne .
        -> GroinMerlin

    ++ [Mathéo]
        mathéo: Une mouche... (elle me défie !)
        mathéo: (Ce marteau devrais suffir...)
        mathéo: Justice !
        // Démolie les rayons
        //~ show ("pamangry")
        pamela: TA DÉMOLI LE RAYON !
        //~ show ("pamlove")
        pamela: … (Mais quelle puissance.)
        -> GroinMerlin

{ SacCiment == true:
+ [Fabriquer du ciment]
    ++ [Ruby]
        { Eau == true:
            ruby: Bon, let's go.
            ruby: Plus qu'a crafter.
            ruby: ... 
            ruby: Ça colle bien, j'ai du ciment !
            ~ Materiaux = "Ciment"
        -else:
            ruby: Ok, j’ai le ciment... 
            ruby: Mais il manque l'eau là...
        }
        -> GroinMerlin

    ++ [Mathéo]
        { Eau == true:
            mathéo: C’est comme un gâteau, non ?
            mathéo: Tu mélanges et hop.
            mathéo: AAAAAAH !
            mathéo: Mes mains sont prises dedans !
            ruby: Bouffon !
            ~ CimentMain = true
        -else:
            mathéo: Faut pas juste verser de la poudre comme ça ?
        }
        -> GroinMerlin

    ++ [Pico]
        { Eau == true:
            pico: Eau... 
            pico: Ciment... 
            pico: On fait remuer le tout...
            pico: Et voilà !
            pico: C'est pas si compliquer.
            {CimentMain == true}pico: Hein Mathéo ?
            ~ Materiaux = "Ciment"
        -else:
            pico: J’ai le ciment, mais c'est tout...
            pico: Faut un fluide... (C'est quoi le truc que dilue avec mon pastis déja ?)
        }
        -> GroinMerlin
}

{ LivreComptes == true:
+ [Chercher les matériaux OG]
    ** [Pico]
        pico: Voyons ce livre...
        pico: Oooooh !
        pico: C’est quoi ce matériau ? J’aime bien, je prends.
        ~ Bois = true
        { Bois == true && Brique == true && Paille == true:
        ~ LivreComptes = false
        pico: C'est bon, je croie qu'on à tout.
        }
        -> GroinMerlin

    ** [Ruby]
        ruby: ...
        ruby: De la brique donc...
        ruby: C’est décidément très rustique, mais si ça marches...
        ruby: Mathéo !
        ruby: J'ai besoin de tes muscles !
        mathéo: Ok, pas plus ?
        ruby: Non sa devrais allez.
        ruby: (Je croie pas que le reste soit très calitatif...)
        ~ Brique = true
        { Bois == true && Brique == true && Paille == true:
        ~ LivreComptes = false
        ruby: On à toute les ressources du livre,
        ruby: On paye et on se tire !
        }
        -> GroinMerlin

    ** [Mathéo]
        mathéo: Donc...
        mathéo: Oui c'est ça...
        mathéo: Surement...
        mathéo: Ce truc dans le livre...
        mathéo: j’en comprend queud !
        mathéo: De la paille ?
        mathéo: ...
        mathéo: Bahh, des paille sa devrais le faire.
        ~ Paille = true
        { Bois == true && Brique == true && Paille == true:
        ~ LivreComptes = false
        mathéo: C'est bon, j'est le matos !
        pico: Perdon pas plus de temps !
        }
        -> GroinMerlin
        
    pico: Y a plus rien de la liste...
    mathéo: Donc ?
    pico: Ouep !
    ruby: Alors on attend quoi ?
    ruby: Le déluge !
    -> GroinMerlin
}


=== function ActivatePuzzle(active)
EXTERNAL ActivatePuzzle(active)
