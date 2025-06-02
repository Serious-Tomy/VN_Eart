INCLUDE 2d_api.ink

-> Introduction // Départ

== ListeDesVAR ==

//VAR Générale
VAR Materiaux = "Aucun"
VAR Argent = 0
VAR NbAlchool = 0
VAR pièceActuelle = "Maison"
VAR NBaction = 50

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
VAR AchatBouteil = false
VAR AchatPorkia = false
VAR AchatC4 = false
VAR AchatBoite = false

//VAR Interieur
VAR IPad = false
VAR Bunker = false
VAR TrappeOpen = false
VAR Cle = false

//VAR restaurant
VAR RedPig = false
VAR RubyDehors = false
VAR Cafeine = false

//VAR Ruines
VAR SacCiment = false
VAR Lampe = false
VAR C4 = false
VAR porteOuverte = false
VAR LivreComptes = false
VAR NoGlasse = false

//VAR AuChamp
VAR ChopeParPierre = false

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

-> ListeDesVAR

=== ActionPrincipale===
+ {pièceActuelle == "Maison"} [Inspecter le rez de chaussée]
-> Interieur
+ {pièceActuelle == "Maison" && TrappeOpen == true} [Entrée dans la Cave]
-> Cave
+ {pièceActuelle == "Ruelle"} [Entrée chez l'Antiquaire]
-> Antiquaire
+ {pièceActuelle == "Ruelle"} [S'approcher du Clochard]
-> Clochard
+ {pièceActuelle == "Ruelle"} [Inspecter les Ruines]
-> Ruine
+ {pièceActuelle == "Place du village"} [S'approcher du Puit]
-> Puit
+ {pièceActuelle == "Place du village"} [Entrée dans la Mairie]
-> Mairie
+ {pièceActuelle == "Allée commerçantes"} [Entrée dans le Au Champ]
-> AuChamp
+ {pièceActuelle == "Allée commerçantes"} [Entrée dans le Restaurant]
-> Restaurant
+ {pièceActuelle == "Allée commerçantes"} [Entrée dans le Groin Merlin]
-> GroinMerlin
+ [Partir ailleurs] Où ?
~ NBaction -= 1
-> ActionChangeScene

=== ActionChangeScene===
+ {pièceActuelle != "Maison"} [La maison] 
~ fadeBg("Maison", 0.5)
narrateur: {~texte 1|texte 2|texte 3}
~ pièceActuelle = "Maison"
-> ActionPrincipale
+ {pièceActuelle != "Ruelle"} [La Ruelle]
~ fadeBg("Ruelle", 0.5)
~ show ("clochardstate")
narrateur: {~texte 1|texte 2|texte 3}
~ pièceActuelle = "Ruelle"
-> ActionPrincipale
+ {pièceActuelle != "Place du village"} [La place du village]
~ fadeBg("Pvillage", 0.5)
narrateur: {~texte 1|texte 2|texte 3}
~ pièceActuelle = "Place du village"
-> ActionPrincipale
+ {pièceActuelle != "Allée commerçantes"} [l'Allée commerçantes]
~ fadeBg("AlleeC", 0.5)
narrateur: {~texte 1|texte 2|texte 3}
~ pièceActuelle = "Allée commerçantes"
-> ActionPrincipale

== Introduction ==
~ fadeBg("Maison", 0.5)
//~ music ("")
narrateur: Il était une fois en Cochonnésie, dans le paisible village de Cochon-les-Bains, trois petits cochons qui coulaient des jours heureux avec leur maman .
narrateur: Sauf qu’à côté, au Perrault, vivaient les Loups ...
narrateur: Pendant longtemps, tout le monde restait de son côté .
narrateur: Pas d’histoire .
narrateur: Pas de problème .
narrateur: Mais ce matin-là ... 
// *Le téléphone sonne.*
narrateur: C’est le père.
narrateur: En mission dans les terres du Perrault.
narrateur: Sa voix tremble ...
~ fadeBg("IlluTelephone", 0.5)
pere: “Mes enfants, l'heure est grave !"
pere: "Les loups ont lancé une bombe à gaz, et pas n’importe quel gaz ..."
pere: "Il transforme les cochons en chair à saucisse et autre charcuterie !"
pere: "Là-bas, ils meurent de faim ..." 
pere: "C’est leur plan de survie, et vous êtes au menu !”
pere: “Vous avez trois heures ..."
pere: "Trouvez un abri et Renforcez-le !"
pere: "Je reviendrai si je le peux.”
// *Sa coupe, bip de téléphone*
~ fadeBg("Maison", 0.5)
ruby: PICO LÂCHE CETTE BOUTEILLE !!
ruby: T’AS PAS ENTENDU ???
ruby: ON VA TOUS FINIR EN RILLETTES !!
pico: Hein ? 
pico: Papa revient ? 
pico: C’est cool ça !
ruby: NON IDIOT !
ruby: ON A TROIS HEURES AVANT D’ÊTRE FUMÉS COMME DES SAUCISSONS !
~ ActivateTimer(true)
matheo: Une bombe qui transforme les gens en knackis ?
matheo: Relax, vous croyez vraiment à ça ?
ruby: C’est pas une blague !
ruby: Papa ne ferait JAMAIS ça !
ruby: On doit trouver un abri, le barricader, et SURVIVRE !
matheo: C’est une fake news ...
matheo: Comme si on allait être transformé en jambon ...
pico: Ah bah c'est sûr ! 
pico: Ca te changerait pas .
pico: T'es déjà une Andouille ...
ruby: (Oh, y'a une MAJ Clash of Clans ...)
matheo: Ok, je vous suis .
matheo: Ca fera mon footing .
pico: Et si on utilisait la cave, ça devrait le faire, non ?
ruby: Pas une seconde à perdre, trouvons la cave .
-> Interieur

== Interieur ==
~ fadeBg("Maison", 0.5)

+ { Bunker == false} [Chercher la cave] Avec ?
    ** [Pico] 
    pico: Bon ...
    pico: Si je me souviens bien .
    pico: Ce tapis fait office de cache .
    // *Le soulève d’un coup sec*
    pico: Voilà la trappe !
    ~ Bunker = true
    ~ NBaction -= 1
    -> Interieur

    ** [Ruby]
    ruby: Si j’étais une cave, je serais où ?
    // *Regarde le canapé, fait glisser une lampe*
    ruby: Ce canapé est trop lourd pour cacher quoi que ce soit d’utile.
    ruby: Et ce tapis ...
    ruby: Non rien ...
    ruby: Rien d'intéressant .
    ruby: Cette maison est une plaie niveau ergonomie !
    ~ NBaction -= 1
    -> Interieur
    
    ** [Mathéo]
    matheo: Une cave ... 
    matheo: C’est sous terre .
    matheo: Je vais voir dans le jardin !
    // *Claque la porte et commence à creuser*
    ...
    ...
    matheo: J’étais censé faire quoi déjà ?
    matheo: ...Ah oui, la cave !
    matheo: J'ai sûrement pas creusé assez profond ...
    // *recommence à creuser*
    ruby: Arrête de creuser ! (On a pas le temps pour tes conneries !)
    ~ NBaction -= 1
    -> Interieur

+ [Chercher des objets utiles] Avec ?
    ** [Pico]
    // *fouille dans le frigo*
    pico: Rien.
    pico: Pas même un canette de bière ...
    // *regarde dans la poubelle*
    pico: Pourquoi y a une tongue ici ?
    pico: Salut... 
    pico: Colonel Flip-Flop.
    pico: Tu saurais pas où trouver une bonne bouteille ?
    ruby: Pico, arrête de jouer avec cette tongue ... 
    ~ NBaction -= 1
    -> Interieur

   ** [Ruby]
    ruby: Où est-ce que j’ai mis mon iPad ?
    // *ouvre des tiroirs, pousse des magazines, soulève des coussins*
    ruby: Ah-ha !
    ruby: Il était entre deux boîtes de pizza .
    ruby: Toujours 73% de batterie.
    ruby: Le destin est avec moi !
    ~ NBaction -= 1
    ~ IPad = true
    -> Interieur
    
    ** [Mathéo]
    matheo: C’est quoi cette boîte énorme ?
    // *la soulève, la secoue*
    matheo: (C'est pas léger en tout cas !)
    matheo: 30 000 pièces, le puzzle ?!
    matheo: Y a de quoi en faire du papier peint !
    matheo: Allez, je prends.
    ~ Materiaux = "Puzzle"
    ~ NBaction -= 1
    -> Interieur
    
    //Par défaut
    ruby: {~Y a plus rien ici |Nada |Ne perdons pas plus de temps }...
    ~ NBaction -= 1
    -> Interieur
    
+ { Bunker == true && TrappeOpen == false} [Ouvrir la cave] Avec ?
{ Cle == true :
    ** [Pico]
    pico: Enfin !
    pico: Elle nous aura fait courir !
    pico: (Hop là, on ouvre ...)
    // *CLIC*
    pico: Oh ..., ça pue le renfermé ...
    pico: ET L'ALCOOL !
    pico: Allez les nazes ! 
    pico: On descend ou quoi ?
    ~ TrappeOpen = true
    ~ NBaction -= 1
    -> Cave
    
    ** [Ruby]
    ruby: Le dénouement de toute une aventure ...
    // *CLIC*
    ruby: Voilà, ouverte !
    ruby: Maintenant... préparez-vous à descendre dans l’inconnu.
    pico: C'est bon la MJ, on n'est pas dans l'un de tes JDR !
    ~ TrappeOpen = true
    ~ NBaction -= 1
    -> Cave
    
    ** [Mathéo]
    matheo: Bon... 
    matheo: On a la clé...
    matheo: On a la trappe...
    matheo: Et ...
    matheo: Ca s'ouvre pas .
    matheo: C’est un tour de magie ou ? 
    matheo: c’est juste vieux ...
    ruby: (T'es juste le bouffon que tu penses être ...)
    pico: Laisse moi faire .
    ~ TrappeOpen = true
    ~ NBaction -= 1
    -> Cave
    }
  
  { Cle == false :
  ** [Pico]
    pico: C'est fermé à clé ?
    pico: Maman ...
    matheo: Je peux peut-être l’ouvrir avec un marteau ?
    pico: Non et non, c’est mort.
    pico: Y’a pas moyen d’ouvrir ce truc sans la clé ...
    ~ NBaction -= 1
    -> Interieur
    
    ** [Ruby]
        ruby: Verrouillée ?
        ruby: Sérieux ?
        ruby: Et évidemment, pas de clé.
        ~ NBaction -= 1
        -> Interieur
        
    ** [Mathéo]
        matheo: Qui l'a verrouillée sérieusement ?
        ruby: Maman à tout les coups .
        matheo: Ok, logique ...
        matheo: On reviendra quand on aura le sésame .
        ~ NBaction -= 1
        -> Interieur
        
    //Par défaut
    pico: C'est maman qui a la clé .
    matheo: Elle est partie où déjà ?
    ruby: A la Mairie .
    pico: Ok, tous à la Mairie !
    ~ NBaction -= 1
    -> Interieur
    }

+ [Sortir de la maison] Pour aller à ?
-> ActionChangeScene

== Cave == //FIN
~ fadeBg ("Cave", 0.5)
"Texte d'introduction au lieu" {~texte 1|texte 2|texte 3}

+ {Materiaux != "Aucun"} [Réparer la cave] Vous appliquer {Materiaux} à la cave .
~ NBaction -= 1
{Materiaux == "Laine"} ~ fadeBg("Blaine", 0.5)
{Materiaux == "PostCocho"} ~ fadeBg("Bposters", 0.5)
{Materiaux == "Rigolofleur"} ~ fadeBg("Brigolodrole", 0.5)
{Materiaux == "Puzzle"} ~ fadeBg("Bpuzzle", 0.5)
{Materiaux == "Fourure"} ~ fadeBg("Bfourrure", 0.5)
{Materiaux == "Porte"} ~ fadeBg("Bportes", 0.5)
{Materiaux == "Enceinte"} ~ fadeBg("Bmurson", 0.5)
{Materiaux == "CochoMobile"} ~ fadeBg("Bmobile", 0.5)
{Materiaux == "OverTune"} ~ fadeBg("Bargent", 0.5)
{Materiaux == "PatCroute"} ~ fadeBg("BPateCroute", 0.5)
{Materiaux == "Porkia33000"} ~ fadeBg("Bporkia33000", 0.5)
{Materiaux == "Ciment"} ~ fadeBg("Bciment", 0.5)
{Materiaux == "Gelée"} ~ fadeBg("Bgelee", 0.5)
{Materiaux == "SourceOG"} ~ fadeBg("Bog", 0.5)
{Materiaux == "Porcium"} ~ fadeBg("Bporcium", 0.5)
-> Cave

+ [Bouclé la cave]
pico: Allez tout le monde dedans !
pico: Ca passe ou ça casse ...
DEBUG: Il vous a fallut {NBaction} action pour arriver à cette fin !
// *fermeture*
narrateur: Les trois frères suite à la fermeture, attendirent la fin ...
narrateur: Un silence pesant régnait dans la cave ...

{Materiaux == "Aucun"} -> Aucun
{Materiaux == "Laine"} -> Laine
{Materiaux == "PostCocho"} -> Poster
{Materiaux == "Rigolofleur"} -> Rigolofleur
{Materiaux == "Puzzle"} -> Puzzle
{Materiaux == "Fourure"} -> Fourure
{Materiaux == "Porte"} -> Porte
{Materiaux == "Enceinte"} -> MurSon
{Materiaux == "CochoMobile"} ->Voiture
{Materiaux == "OverTune"} ->Riche
{Materiaux == "PatCroute"} ->PateCroute
{Materiaux == "Porkia33000"} ->Nokia3310
{Materiaux == "Ciment"} ->Ciment
{Materiaux == "Gelée"} ->Gelatine
{Materiaux == "SourceOG"} ->OG
{Materiaux == "Porcium"} ->Porcium

+ [Sortir]
-> ActionPrincipale

=Aucun
narrateur: Bon ...
narrateur: Ils n’ont rien renforcé ...
narrateur: Pas une planche .
narrateur: Pas un bout de scotch !
narrateur: Rien .
narrateur: Nos trois petits génies ont donc décidés de faire confiance... à la chance ?
narrateur: À l’univers ...
narrateur: À l’amour cosmique ...
narrateur: ...
narrateur: Mais contre une bombe qui transforme les cochons en charcuterie fine ...
narrateur: La foi, n’est pas une stratégie avisée ...
// *transformation en charcuterie*
narrateur: Et voilà .
narrateur: En quelques secondes, c’est terminé .
narrateur: Les murs sentent le bacon .
narrateur: Et dans un coin ...
narrateur: Un iPad fondu .
narrateur: Ils auront au moins tenté quelque chose ...
narrateur: En fait, Non .
narrateur: Non ...
narrateur: Ils ont juste espéré très très fort .
~ BadEnd = true
-> END

=Laine
~ fadeBg("Blaine", 0.5)
//~ music ("")
narrateur: Bon...
narrateur: Ils ont mis quelque chose .
narrateur: Une matière rare ...
narrateur: Noble !
narrateur: De la laine .
narrateur: DE ...
narrateur: La ...
narrateur: LAINE !
narrateur: Voilà donc l’armure ultime choisie pour contrer une ogive chimique carnivore ...
narrateur: Un tricot .
narrateur: Une pelote .
narrateur: Un espoir en cachemire !
narrateur: L’ambiance est douce, certes .
narrateur: Confortable, même .
narrateur: Mais pas très étanche ...
narrateur: Le gaz entre comme chez lui ...
narrateur: S’installe .
narrateur: Visite .
// *transformation en charcuterie*
narrateur: Il transforme ...
narrateur: Nos trois héros, désormais des chaussons fumés .
narrateur: Repose désormais sur une écharpe carbonisée ...
narrateur: Quelle farce !
-> END

=Poster
~ fadeBg("Bposters", 0.5)
//~ music ("dramaSadLoop")
narrateur: Cette fois ...
narrateur: Ils se sont surpassés !
narrateur: L’idée est brillante .
narrateur: Visionnaire, même !
narrateur: Pour se protéger d’une arme chimique ...
narrateur: Ils choisirent ...
narrateur: Des posters .
narrateur: Oui .
narrateur: Des posters .
narrateur: Des affiches en papier glacé .
narrateur: Collées au mur comme des sortilèges anti-apocalypse.
narrateur: ...
narrateur: Et pas n’importe lesquels !
narrateur: Des posters de cochons en bikini ...
narrateur: Avec des poses aguicheuses .
narrateur: Des lunettes de soleil .
narrateur: Et les flamants roses gonflables en arrière-plan ...
narrateur: Nos héros les ont regardés, confiants .
narrateur: Le duo d'un sourir béat .
pico: “T’inquiète, ça va faire barrière.”
matheo: "O... ouais ..."
narrateur: Dirent-ils, les yeux fixés sur les murs ...
narrateur: Le gaz arriva, traversa, "jugea" même .
narrateur: Les posters ...
narrateur: Fondent .
narrateur: Comme leurs espoirs .
narrateur: L’air devient irrespirable .
// *transformation en charcuterie*
narrateur: Et l’odeur ?
narrateur: Un savant mélange de papier mouillé, et de sueur au effluve de jambon chaud.
narrateur: Sauver sa vie avec des affiches sexy ...
narrateur: C’est ... 
narrateur: Audacieux !
-> END

=Rigolofleur
~ fadeBg("Brigolodrole", 0.5)
//~ music ("")
narrateur: Ils ont décoré la cave .
narrateur: C’est mignon .
narrateur: Des fleurs partout ...
narrateur: Des dizaines de fleurs Rigolodrôles, soigneusement disposées dans chaque recoin .
narrateur: Elles sourient .
narrateur: Elles dansent .
narrateur: On se croirait dans un festival hippie .
narrateur: Mais à la différence près, que dans ce festival .
narrateur: Tout le monde meurt à la fin ...
narrateur: Car derrière son sourire permanent ...
narrateur: C’est surtout un champignon chimique ambulant !
narrateur: Son pollen ?
narrateur: Du LSD naturel ...
narrateur: Planté dans une cave fermée hermétiquement ...
narrateur: Avec un peu de chaleur ...
narrateur: La réaction est immédiate !
narrateur: Pico voit un cochon président lui parler en binaire .
narrateur: Mathéo hurle à ses muscles qu’ils l’ont trahi .
narrateur: Ruby code un jeu vidéo avec une boîte de thon ...
narrateur: Et pendant ce festival psychédélique...
narrateur: La bombe tombe .
narrateur: Mais eux…
narrateur: Ils la voient comme un gros marshmallow qui descend du ciel !
narrateur: Spoiler !
narrateur: Ce n’était pas un marshmallow .
// *transformation en charcuterie*
narrateur: Quelques instants plus tard ...
narrateur: Une douce odeur fumée se fit sentir dans la cave .
narrateur: Ruby, Pico et Mathéo ?
narrateur: Trois bouquets de tranches de rosette artisanale ...
narrateur: Sérieusement... 
narrateur: Qui fait confiance à une plante qui danse ?!
-> END

=Puzzle
~ fadeBg("Bpuzzle", 0.5)
narrateur: Bon .
narrateur: C’est officiel .
narrateur: Ces trois cervelles de jambon ont décidé de se protéger ...
narrateur: Avec un puzzle ...
narrateur: De 30 000 pièces plus exactement !
narrateur: Une boîte aussi grosse que leur naïveté ...
narrateur: Collé à la main, le tout tenait à peine .
narrateur: Mais c’était “beau”, selon Mathéo .
narrateur: Quand la bombe percuta le sol .
narrateur: Son souffle ne rencontra aucune résistance ...
narrateur: S’infiltrant doucement entre les pièces du puzzle .
narrateur: Il ne fallut que quelques secondes pour que l'on retrouve dans la cave ...
// *transformation en charcuterie*
narrateur: Trois amoncelements de dés de jambon parfaitement cubiques .
narrateur: Un miracle de la découpe moléculaire !
narrateur: Ironique ...
narrateur: Non ?
narrateur: Du jambon 500 pièces, édition limitée !
narrateur: Montage 4 heures .
narrateur: Durée de vie 3 minutes .
narrateur: Certification charcutière !
narrateur: Leur dernière œuvre collective ...
-> END

=Fourure
~ fadeBg("Bfourrure", 0.5)
narrateur: Bon ...
narrateur: Apparemment, on en est là .
narrateur: Des fourrures .
narrateur: Oui, des peaux de bête .
narrateur: TENDUES sur les murs comme des trophées de chasse .
narrateur: “C’est de la loutre !” criait Mathéo, tout fier .
narrateur: “C’est isolant et trop stylé !”
narrateur: Il avait même fait des ourlets !
narrateur: Sauf que voilà ...
narrateur: Ce n’était pas de la loutre .
narrateur: Non .
narrateur: C’était bien de la peau de loup .
narrateur: Ultra dense, probablement prélevée de manière ...
narrateur: Douteuse .
narrateur: Mais le plus absurde ?
narrateur: Ça a marché .
narrateur: Pas complètement, hein.
narrateur: Faut pas rêver ...
narrateur: Le gaz est entré ...
narrateur: Légèrement frêné .
narrateur: Et du coup ?
narrateur: Pico avait des petits tranches rosées sur les flancs .
narrateur: Ruby était dotée d'un soupçon de jambon dans la voix .
narrateur: Et Mathéo...
narrateur: Bah, il continue de penser que c’était de la loutre avec ses oreilles panées .
narrateur: Et franchement ?
narrateur: Je crois qu’il vaut mieux le laisser croire ça .
narrateur: Une illusion vaut parfois mieux que la conscience d’avoir tapissée sa cave avec l’ennemi .
-> END

=Porte
~ fadeBg("Bportes", 0.5)
narrateur: Alors là...
narrateur: Là !
narrateur: Nos petits cochons ont trouvé des portes .
narrateur: Pas des portes blindées, non non ...
narrateur: Des portes en bois massif .
narrateur: Et qu’ont-ils fait avec ?
narrateur: Ils les ont appuyées contre les murs, façon bricolage d’urgence .
narrateur: Avec, attention ...
narrateur: Du scotch .
narrateur: Et deux clous, tordus .
narrateur: Par Pico ... <>
<>(On reconnait l'artiste ...)
narrateur: Dès le premier choc, suite à la frappe ...
narrateur: Une porte chuta .
narrateur: Puis deux .
narrateur: Puis trois ...
narrateur: L’effet domino était spectaculaire !
narrateur: Le gaz, lui, a juste attendu que la forteresse se replie sur elle-même avant d'entrer en scène .
narrateur: Ce qu’on a retrouvé ensuite ?
narrateur: Trois terrines de luxe, cuites à l’étouffée dans une chambre en bois noble .
narrateur: Parfum résine .
narrateur: Texture fondante .
narrateur: De la charcuterie de prestige, édition bois de feuillus !
-> END

=MurSon
~ fadeBg("Bmurson", 0.5)
narrateur: C’est là qu’en est la stratégie ?
narrateur: Mettre la musique à fond ...
narrateur: Mais pas juste fort .
narrateur: AU MAXIMUM !
narrateur: Et leur idée derrière ça ?
narrateur: Créer un mur du son ...
narrateur: Littéralement !
narrateur: "Si le bruit peut casser un verre, il peut bloquer un gaz", disait Ruby, très sérieuse .
narrateur: Logique ...
narrateur: Alors ils mirent du Pigstep .
// *Pigstep Saturé*
narrateur: LA CAVE VIBRAIT COMME UN TAMBOUR DE MACHINE A LAVER EN PLEINE CRISE EXISTENTIELLE .
narrateur: ET LE GAZ ?
narrateur: IL A RALENTI, ETONNAMENT !
narrateur: PAS STOPPE, HEIN !
narrateur: MAIS DESORIENTE ...
narrateur: COMME S’IL AVAIT LUI AUSSI UN PEU HONTE D’ENTRER LA-DEDANS !
// *Eteind boom box*
narrateur: Résultat ?
narrateur: Nos trois héros sont toujours vivants .
narrateur: Mais disons que... <>
<>le jambon a commencé à mariner ...
narrateur: Ruby a une oreille en rillette .
narrateur: Mathéo transpire du saucisson sec .
narrateur: Et Pico...
narrateur: Pico cloche quand il marche cette andouille .
narrateur: Littéralement !
narrateur: Mais hé ...
narrateur: Ils ont survécu !
narrateur: Un peu mutants ...
narrateur: Mais encore capable de danser .
narrateur: Comme quoi, parfois, la musique adoucit vraiment les mœurs .
narrateur: Même celles d’une bombe ...
-> END

=Voiture
~ fadeBg("Bmobile", 0.5)
narrateur: Alors là ...
narrateur: Une vraie trouvaille !
narrateur: "La Cochonou Mobile", édition collectionneur, stickers saucisson inclus .
narrateur: Voiture chérie du maire de Cochon-les-Bains .
narrateur: Pièce par pièce ...
narrateur: Ils la démontèrent !
narrateur: Portière, capot, pare-chocs ...
narrateur: Soudant le tout sur les murs de la cave comme des plaques d’armure .
narrateur: A l'instant où la bombe a explosé ...
narrateur: Miracle !
narrateur: La structure a tenu !
narrateur: Enfin ... <>
<>un peu ?
narrateur: Le gaz s’est tout de même infiltré par les trous du pot d’échappement ...
narrateur: Ils ont survécu !
narrateur: Oui .
narrateur: Mais ...
narrateur: Ruby a les orteilles en tranches de mortadelle .
narrateur: Mathéo a les cuisses marbrées comme du jambon de pays .
narrateur: Et Pico sent fortement le pâté ... <>
<>(pas sûr qu'il est vraiment changé donc ...)
narrateur: Bref .
narrateur: Une victoire tiède, à demi-salée ...
narrateur: Mais au moins, ils sont vivants !
narrateur: À condition de rester bien au frais ...
-> END

=Riche
~ fadeBg("Bargent", 0.5)
narrateur: L’argent ne fait pas le bonheur .
narrateur: Mais un excellent mur anti-gaz ...
narrateur: Car oui !
narrateur: Il faut dire qu’avec tout ce qu’ils avaient volé ...
narrateur: Ou “gagné”, comme dirait le clochard .
narrateur: Ils pouvaient se le permettre !
narrateur: Des liasses de billets, collées directement sur les parois de la cave .
narrateur: Une isolation "premium", édition banque centrale !
narrateur: Alors ils ont tout mis !
narrateur: Billets froissés ...
narrateur: Billets neufs ...
narrateur: Même un chèque-cadeau de chez ...<>
<> Picard ?
narrateur: Et incroyable comme cela puisse être ...
narrateur: Ca a un peu marché !
narrateur: Le gaz a été ralenti par l’épaisseur des devises .
narrateur: Mais pas stoppé ...
narrateur: Du coup ...
narrateur: Ruby est moitié cochon, terrine ...
narrateur: Pico suinte le saucisson sec ...
narrateur: Et Mathéo a un fessier en filet mignon, estampillé “Banque de Cochonnésie” ...
narrateur: Leurs économies ?
narrateur: Évaporées ...
narrateur: Bref...
narrateur: Ils ont survécu ...
narrateur: A sec, et légèrement comestibles .
narrateur: Comme quoi, même en temps de crise, ... 
narrateur: l’investissement immobilier reste risqué !
-> END

=PateCroute
~ fadeBg("BPateCroute", 0.5)
narrateur: Non .
narrateur: NON !
narrateur: ET NON !!!
narrateur: Je refuse de commenter ça sérieusement !
narrateur: Ils ...
narrateur: Ils ont littéralement tartiné les murs .
narrateur: Avec du pâté en croûte végétarien !?!
narrateur: Pas du béton .
narrateur: Pas du métal .
narrateur: Non !
narrateur: Du pâté ...
narrateur: En croûte ..!
narrateur: VEGETALE !!!
narrateur: Le pire ..., <>
<>c’est que ça a un peu marché !
narrateur: Quand le gaz s'est infiltré ...
narrateur: Il fut frêné par une couche de pois-chiches compacts, <>
<> une barrière de céleri et ...
narrateur: Une épaisse purée d’aubergine tiède ... (Heurk !)
narrateur: Conclusion ?
narrateur: Pico a des doigts en chorizo .
narrateur: Mathéo a des joues en tapenade .
narrateur: Et Ruby éternue des Knackis .
narrateur: C'EST TROIS JAMBON ONT SURVECU !
narrateur: Je ...
narrateur: Je suis sincèrement perturbé ...
narrateur: Est-ce qu’on vient de battre une arme de destruction massive avec ... <>
<> une entrée froide ?
narrateur: Est-ce que je suis le seul à ressentir un début de migraine ?
narrateur: Bref .
narrateur: Bravo à eux .
narrateur: Et honte à la logique !
-> END

{Materiaux == "PeauBete":
narrateur: Donc ...
narrateur: Ils ont acheté des peaux de loutre ...
narrateur: C’est ce que disait le clochard en short dans la ruelle en tout cas.
narrateur: Bon ...
narrateur: Honnêtement ?
narrateur: Ca pue le coup foireux ...
narrateur: Et pas seulement à cause de l’odeur rance des peaux ...
narrateur: Puis bizarrement ...<> 
<>, ça a un peu repoussé le gaz .
narrateur: Peut-être parce qu’il a reconnu une menace ?
narrateur: En tout cas, nos trois petits malins ont survécu !
narrateur: À moitié ...
narrateur: Pico a désormais un museau en salami .
narrateur: Ruby a les avant bras en bacon .
narrateur: Et Mathéo a l'échine en grillote .
narrateur: Mais ce n’est pas ce qui me dérange le plus .
narrateur: Non ...
narrateur: Etait-ce vraiment de la loutre ?
}
-> END

=Nokia3310
~ fadeBg("Bporkia33000", 0.5)
narrateur: Alors ça !
narrateur: Ça dépasse toute ma compréhension ...
narrateur: Et mes limites de tolérance .
narrateur: Les trois frères ont posé un vieux téléphone au centre de la pièce.
narrateur: Le Porkia 3310 .
narrateur: Un modèle si résistant ... 
narrateur: QU'IL PLIE LES LOIS DE LA PHYSIQUE ELLE MÊME !
narrateur: La bombe une fois tombée, le gaz s’est infiltré par tous les interstices .
narrateur: Mais à trois mètres du téléphone ...
narrateur: Il disparu .
narrateur: Dissous ...
narrateur: Dissipé !
narrateur: Évaporé dans une bulle d’incompréhension technique .
narrateur: Le Porkia 3310 n’avait pas bougé .
narrateur: Ruby pleurait de joie .
narrateur: Mathéo parlait de “prophète à touches” .
narrateur: Pico lui cassait des noix avec ...
narrateur: "Un apéro pour fêter ça ?", dit-il avec bougon ...
narrateur: Et moi ?
narrateur: Je regardais la scène, en me demandant si la science avait encore un sens ...
narrateur: Sincèrement ?
narrateur: Bravo !
narrateur: Notre fine équipe a survécu ...<>
<>, grâce à un rectangle de plastique de l’ère glaciaire .
narrateur: Félicitations !
-> END

=Ciment
~ fadeBg("Bciment", 0.5)
narrateur: ...
narrateur: Attendez ...
narrateur: Est-ce que...<>
<>, est-ce que je rêve ?
narrateur: Du ciment ?
narrateur: ILS ONT UTILISÉ DU CIMENT !
narrateur: Juste ...
narrateur: Du béton .
narrateur: Un bon vieux mélange gris, moche, et ULTRA efficace .
narrateur: Ça tartinait les murs à la truelle dans toute la cave .
narrateur: Ruby lisait la notice .
narrateur: Mathéo lissait les joints .
narrateur: Pico a même fait une chape .
narrateur: Une CHAPE !
narrateur: Suis-je ... fier ?
narrateur: Non ...
narrateur: Pas encore.
narrateur: Mais ému, un peu ...
narrateur: Quand la bombe est tombée, le gaz a frappé un mur si lisse, <>
<>si étanche, <>
<>si solide !
narrateur: Qu'il a rebroussé le chemin .
narrateur: Bon, d’accord ...
narrateur: Pico a cimenté son pied par accident ...
narrateur: Mais dans l’ensemble ?
narrateur: C’est un succès .
narrateur: UNE VRAIE FIN !
narrateur: Pas une bêtise, pas un miracle .
narrateur: Juste ... 
narrateur: Un bon choix .
narrateur: Je vais devoir m’allonger .
narrateur: J’ai besoin de digérer ça ...
narrateur: Félicitation !
-> END

=Gelatine
~ fadeBg("Bgelee", 0.5)
narrateur: Non mais là je ...
narrateur: Vous allez me dire que j’invente .
narrateur: Ils ont utilisé ...
narrateur: De la gelée .
narrateur: Verte pomme, tremblante et collante ...
narrateur: Ils en ont recouvert les murs et le plafond .
narrateur: Ruby en avait sur ses lunettes ...
narrateur: Mathéo ?
narrateur: Il observait son reflet au travers .
narrateur: Pico sautait dedans comme dans une piscine à flan .
narrateur: L’ambiance était à la fête foraine .
narrateur: Et pourtant ...
narrateur: Quand la bombe est tombée ...
narrateur: Le gaz est entré ...
narrateur: Et a ... 
narrateur: Rebondi ?!
narrateur: Je ...
narrateur: Je n’ai aucune explication logique à cela ...
narrateur: Les molécules ont ricoché sur les parois gélifiées comme sur un trampoline .
narrateur: Trois fois ...
narrateur: Résultat ?
narrateur: Trois cochons vivants .
narrateur: Un bunker gluant .
narrateur: Et une odeur de bonbon chimique pour les dix prochaines années ...
narrateur: J’ose à peine le dire ...
narrateur: Grâce à la gelée, ils ont survécu à une attaque chimique ...
narrateur: Félicitations ...
-> END

=OG
~ fadeBg("Bog", 0.5)
narrateur: Oh, attendez ...
narrateur: C’est ... 
narrateur: Est-ce un hommage ?
narrateur: Non ...
narrateur: Une régression ?
narrateur: Nos trois petits cochons ont ...
narrateur: Reconstruit le conte .
narrateur: Un mur en paille .
narrateur: Un autre en bois .
narrateur: Et le dernier, en brique .
narrateur: Pico a dit : “C’est symbolique !”
narrateur: Ruby : “Si ça marche, je mange mon iPad ...”
narrateur: Mathéo a soufflé dessus, pour "vérifier la solidité" .
narrateur: C'est alors, que le gaz est arrivé .
narrateur: Et là ..., <>
<>mes attentes se sont effondrées ...
narrateur: Pas les murs .
narrateur: Eux, ils ont tenu ...
narrateur: Même la paille, par on ne sait quel miracle a tenu ...
narrateur: Le bois s’est gonflé, comme pour dire “pas aujourd’hui” .
narrateur: Et la brique ?
narrateur: Comme toujours, impeccable .
narrateur: Le gaz n’a rien pu faire .
narrateur: Pas un frisson de jambon à l’horizon .
narrateur: Ils l’ont fait !
narrateur: Ils ont..., <>
<>respecté la tradition .
narrateur: Comme quoi, parfois, pour survivre...
narrateur: Il suffit d’un peu de mémoire .
narrateur: Beaucoup d’huile de coude ...
narrateur: Et un mur de paille bien compressée !
narrateur: Bravo !
narrateur: C’est une fin digne d'un compte !
narrateur: Et pour une fois ..., <>
<>elle ne sent pas le jambon ...
-> END

=Porcium
~ fadeBg("Bporcium", 0.5)
narrateur: Je pensais avoir tout vu ...
narrateur: Mais ça ?
narrateur: Nos trois petits cochons .
narrateur: Ont posé une pierre au lueur étrange au centre de la pièce ...
narrateur: Elle émettait des vrombissements électromagnétiques ...
narrateur: Et bien sûr .
narrateur: Personne ne s’est posé de questions sur son efficacité ?
narrateur: Le gaz rentra sans aucune difficulté .
narrateur: Lent, dense, et prêt à transformer nos cochons en carpaccio ...
narrateur: C'est alors !
narrateur: Qu'une réaction inatendue était arrivée en un éclair .
narrateur: Et...
narrateur: Ça dépasse l’improbable !
narrateur: ... Les cochons s'était transformés !
narrateur: Pico peut désormais eructé un souffle mentholé tellement concentré qu’il condense les gazs dans l’air .
narrateur: Ruby est devenue capable de transformer n'importe quel outil électronique en éponge ...
narrateur: Et Mathéo !
narrateur: Mathéo ...
narrateur: Est dans la capacité d'invoquer la N-zone, ce qui obstrue la lumière pendant 0,4 secondes ...
narrateur: Autrement dit !
narrateur: Rien de très utile . 
narrateur: Et pourtant ...
narrateur: Ils réussirent a contenir le gaz !
narrateur: OUI MONSIEUR !
narrateur: Devant des pets au Méthanol à 64,7° et une éponge !!!
narrateur: Le nuage avait DISPARU !
narrateur: Absorbé par un iPad désormais transformé en éponge ...
narrateur: Comme s’il y avait une LOGIQUE à ces évenements absurdes !
narrateur: ...
narrateur: Mais je m’en fiche !
narrateur: Ils sont vivants, non ?
narrateur: Un magniphique trio de super zéro !
narrateur: Une fin ridicule .
narrateur: Et pourtant ça marche ...
narrateur: Bravo les ...<>
<> héros ?
-> END

== Antiquaire ==
~ show ("antidle")
Antiquaire: Bienvenue dans mon antre, les Chons... 
Antiquaire: Que venez-vous chercher dans ce capharnaüm de trésors oubliés ?
-> entree

= entree
+ [Parler à l'antiquaire] Avec ?
    ** { PicoDehors == false } [Pico] 
        pico: Tu vends des objets magiques ?
        pico: J’ai besoin de ma dose.
        ~ show ("antasking")
        antiquaire: Hmm… Magique ?
        antiquaire: Pas vraiment… 
        ~ show ("anthappy")
        antiquaire: Mais j’ai cette magnifique chenille en or !
        ~ show ("antidle")
        antiquaire: Parfaite pour les amateurs d’originalité...
        pico: Non, non... 
        pico: J’veux ma *dose*, pas un gadget pour vieux collectionneur.
        ~ show ("antasking")
        antiquaire: Si tu cherches du bizarre, j’ai entendu parler d’une vieille lampe abandonnée dans les ruines.
        ~ show ("antidle")
        antiquaire: Elle aurait un petit air magique.
        ~ NBaction -= 1
        -> entree

    ** [Ruby]
        ruby: Je cherche du matos électronique, t’as ça ?
        ~ show ("antasking")
        antiquaire: Tu te crois être dans un magasin a la noix ici ?
        ~ show ("anthappy")
        antiquaire: Je ne vends que du matériel noble, de l’authentique, de l’unique !
        ~ show ("antidle")
        ruby: Noble ?
        ruby: T’appelles ça noble ? 
        ruby: C’est de la camelote ton bric-à-brac…, même pas un pet de circuit imprimé dans tout le magasin.
        ~ show ("antangry")
        antiquaire: Comment ?!
        antiquaire: Tu insultes ma boutique ?
        ruby: Ton "matériel noble", c’est juste un tas de vieux trucs bons pour le grenier de mémé.
        ~ NBaction -= 1
        -> entree

    ** [Mathéo]
        matheo: Vous avez des objets vraiment précieux ici ?
        ~ show ("anthappy")
        antiquaire: J’ai de tout !
        ~ show ("antidle")
        antiquaire: Bijoux anciens, meubles rares, objets d’époque… 
        ~ show ("antsad")
        antiquaire: Malheureusement, l’un des plus beaux m’a été volé.
        matheo: Dis-moi qui l’a volé, je vais lui refaire le portrait.
        ~ show ("antidle")
        antiquaire: Calme-toi.
        antiquaire: C’est mon frère.
        ~ show ("antsad")
        antiquaire: Il squatte devant la boutique et refuse de me rendre ce qu’il m’a pris.
        ~ NBaction -= 1
        -> entree

+ [Voler] Avec ?
~ show ("antidle")
    ** { PicoDehors == false } [Pico] 
        pico: Bon... (j’vais m’faire discret et choper un truc intéressant...)
        ~ hide ("antidle")
        pico: Un lustre vénitien en or massif !
        // Le fait tomber comme un manche.
        ~ show ("antangry")
        antiquaire: TOUCHE PAS À ÇA !!!
        antiquaire: VOLEUR !
        // Ext jeté dehors à coups de pied dans le gras.
        ~ PicoDehors = true
        ~ NBaction -= 1
        -> entree

    ** [Ruby]
        ruby: (Voyons s’il a planqué un vieil ordi ou une puce quelque part...)
        // Fouille méthodiquement.
        ruby: Rien...
        ruby: Nada.
        ruby: Même pas un câble USB!
        ruby: Tout ce matos est dépassé !
        ruby: Ce gars vit dans une autre époque, il pige rien à la vraie tech...
        ~ NBaction -= 1
        -> entree

    ** { Materiaux == "Aucun"} [Mathéo] 
        matheo: C’est quoi ça ? (une pelote de laine ?)
        matheo: Ça peut toujours servir...
        matheo: (Et hop, dans les poche...)
        // La glisse dans son sac en sifflotant.
        ~ Materiaux = "Laine"
        ~ NBaction -= 1
        -> entree
        
+ { connai_boite == true } [Parler de la boîte] Avec ?
    ** { PicoDehors == false } [Pico] 
        pico: J’ai entendu parler d’une boîte...
        pico: Tu saurais où elle est ?
        ~ show ("antasking")
        antiquaire: La boîte à musique ?
        ~ show ("antidle")
        antiquaire: Elle est avec mon frère, le type dans la ruelle.
        ~ show ("antsad")
        antiquaire: Va le voir, mais vas-y mollo, il est déjà assez fêlé.
        ~ show ("antidle")
        ~ NBaction -= 1
        -> entree

    ** [Ruby]
        ruby: Dis, la boîte là !
        ruby: Tu sais, la boîte ! 
        ruby: En bois ! Genre chaudron, mais avec des trucs en fer dessus…
        ruby: Tu vois ?
        ~ show ("antangry")
        antiquaire: Oui, oui...
        ~ show ("antidle")
        antiquaire: Tu parles beaucoup trop (une vrai pille...)
        antiquaire: C'est mon frère dans la ruelle qu'il l'a détient...
        antiquaire: Tiens, prends ça, et va le récupérer...
        antiquaire: Tu veux ?
        // Pésente de l'espèce, des piece qui teinte au choc
        ~ Argent += 1
        ~ show ("anthappy")
        antiquaire: (Bon débarras.)
        ~ show ("antidle")
        antiquaire: (Elle m’aurait tenu la jambe pendant une heure sinon...)
        ~ NBaction -= 1
        -> entree

    ** [Mathéo]
        matheo: Écoute ma jolie, j’en ai marre de chercher cette boîte.
        matheo: Tu sais où elle est ou pas ?
        ~ show ("anthappy")
        antiquaire: Aucune idée...
        ~ show ("antidle")
        antiquaire: (Si je lui dit il va le rouer de coup...)
        ~ show ("anthappy")
        antiquaire: Mais regarde cette tondeuse Cochonou de collection plutôt !
        antiquaire: En saphir massif !
        antiquaire: Promo du siècle !
        ~ show ("antidle")
        matheo: Euche !
        matheo: Dit Pico on peux l'ache...
        ~ show ("pico")
        pico: Non...
        ~ hide ("pico")
        matheo: ...
        ~ NBaction -= 1
        -> entree

+ [Sortir de la boutique]
~ show ("anthappy")
Antiquaire: Au plaisire de vous revoir !
~ show ("antidle")
~ NBaction -= 1
-> ActionPrincipale

== Clochard ==

+ {ClodoKo == false} [Parler au clochard] Avec ?
++ [Pico Chon]
{->ParleCloclo1|->ParleCloclo2|->ParleCloclo3|->ParleCloclo4}

++ {Spray == false && CryptoMoney == false} [Ruby Chon]

    {Cafeine == false: // Vous tentez une approche, mais sans succès...
    ruby: Pourquoi {~j’irai lui parler ?|faire ?|insister ?}
    ruby: Il ne comprendrait pas la moitié de ce que je lui dis.
    ruby: {~En plus, je n’ai pas assez d’énergie pour ça...|Peut-être qu’avec un café...|Pfff, j’ai besoin d’un remontant...}
    -> Clochard
    }

    {Cafeine == true:
        {CryptoMoney == false:
        ruby: Tu sais que t’as le prérequis pour monter ton empire, là ?
        clochard: Tu penses parler à qui au juste ?
        ruby: Je parle de toi.
        ruby: Avec ce que tu sais faire, tu pourrais vivre de la crypto.
        clochard: J’ai déjà vécu du yaourt périmé pendant six jours…
        clochard: On m’impressionne plus avec des mots grecs.
        ruby: C’est pas grec, c’est numérique.
        ruby: V I R T U E L …
        ruby: C’est de l’argent, mais sans pièces, ni billets.
        clochard: Donc c’est comme les promesses de Bernard, le boulanger.
        ruby: Non !
        ruby: C’est fiable, et on appelle ça de la blockchain.
        clochard: Des chaînes de vélo ?
        ruby: Pas ce genre de chaîne !
        ruby: C’est un registre décentralisé.
        clochard: La seule décentralisation que j’ai connue, c’est quand j’ai dormi entre deux bancs près du parc.
        ruby: Bon, regarde…
        ruby: Là, j’ai investi dans une pièce qui s’appelle Pigcoin.
        clochard: Ouais…
        clochard : Et ça sert à quoi, ton “Pig-coin” ?
        ruby: À faire des transactions, acheter, vendre, investir…
        clochard: Moi j’échange un briquet vide contre une soupe.
        clochard: T’appelles pas ça une transaction peut-être ?
        ruby: T’as pas tort, mais c’est là que j’y viens…
        ruby: Imagine utiliser tes talents de vendeur comme tu le fais à une échelle mondiale.
        clochard: J’ai même pas de brosse à dents.
        clochard: Et tu veux que je gère une économie planétaire ?
        ruby: Si t’as un vieux téléphone, tu peux déjà commencer.
        clochard : J’en ai un qui vibre sans prévenir…
        ruby: Ça fera l’affaire…
        ruby: On va t’ouvrir un portefeuille virtuel.
        ruby: Et ensuite…
        ~ CryptoMoney = true
        }
    
        {CryptoMoney == true:
        ruby: {Alors, ça mine ?|Les blockchain se portent bien ?|T’as besoin de conseil ?}
        clochard: Ouais, ouais...
        clochard: {Là, je suis en train de manipuler le commerce...|T’as déjà vu mon dernier NFT "Garbage", il fait un "carton". (littéralement !)|Pas besoin, je suis dans le flux...}
        }
    }
-> Clochard

++ [Mathéo Chon] // se fait insulter par le clochard
{->ParleMath1|->ParleMath2|->ParleMath3|->ParleMath4|->ParleMath5}

+[Attaquer le clochard] Avec ?
++ {ClodoKo == false} [Pico Chon]
// Lance une bouteille, elle casse à côté, bruit de verre cassé
~NBbouteillelancer += 1
    {NBbouteillelancer == 1:
    clochard: T’as essayé de faire quoi là ?
    pico: D’te donner à boire...
    clochard: Ho ...
    clochard: Tu nettoiras tes cochonneries après hein ?
    pico: ...
    clochard: ...
    }
    {NBbouteillelancer >= 2:
    clochard:{~Tu comptes en lancer encore combien ?|Tu vas me laisser nettoyer à chaque fois ?|Et de {NBbouteillelancer}, tu les sors d’où toutes ces bouteilles ?}
    }
-> Clochard

** {ClodoKo == false && Spray == false} [Ruby Chon]
clochard: Eh bien…
clochard: Que me vaut cette approche ?
clochard: Tu veux que je te cagole ma ...?
ruby: HAAAA M’APPROCHE PAS !
// Coup de spray à Ours pendant 1 min
clochard: HAAAA !!!
clochard: Sale petite ***** de ****** !
clochard: ***** *** ** **** ******* **** !
ruby: Je ne m’approche plus de ce type à moins d’un mètre !
~Spray = true
-> Clochard

++ {NNFrappe <= 9} [Mathéo Chon]
-> MathAttaqueClo

+ {ClodoKo == false} [Commercer avec la clochard]
-> ClochardBoutique

+ {ClodoKo == true} [Fouiller le clochard]
-> FouillCloclo

+[Partir]
{ClodoKo == false} clochard: À un de ses quatre !
{ClodoKo == true} ...
-> ActionPrincipale

=FouillCloclo
* [Boîte à musique]
pico: La voilà !
ruby: Alors grouille toi de l'ouvrir !
pico: Je vois pas comment ...
ruby: Et bien cherchons !
ruby Allez on l'ouvre .
~ ActivatePuzzle(true)
-> Clochard

* [Porkia 3310]
ruby: De ce que je sais les Porkia 3310 sont réputés indestructibles !
matheo: Ca repousse le gaz tu crois ?
ruby: Heuuu...
pico: On prend .
~ Materiaux = "Porkia33000"
-> FouillCloclo

* [C4]
matheo: Il préparait une guerre ou ?
ruby: Je ne veux même pas le savoir !
pico: On prend .
ruby: ?!?
matheo: Chaud ...
~ C4 = true
-> FouillCloclo

* [Poster cochon]
matheo: ?!?
matheo: Pico, mate moi ça !
pico: !!!
pico: ON PREND !
ruby: (Primate ...)
~ Materiaux = "PostCocho"
-> FouillCloclo

* [Fourur de ...]
pico: C'est de la fourrure de lou...
ruby: LOUTRE !
ruby: De la fourrure de loutre ...
pico: Non, je suis sûr que c'est du ...
ruby: Mais ezbvkdfg ...
ruby: Ne dit pas un mot de plus !
ruby: Pas devant Mathéo ...
matheo: Cool, cette fourrure de loutre !
matheo: Elle ressemble à Pierre !
pico: On .
pico: On ...
pico: Prend ?
~ Materiaux = "Fourure"
-> FouillCloclo


ruby: Tu vas pas aller jusqu'a lui voler son calçon !
pico: Non, c'est bon ...
-> Clochard

= ClochardBoutique 
Présentation de son commerce froduleux

+ {AchatPorkia == false} [Porkia 3310]
** [Questionné]
clochard: Ha ha, je vois que vous avez du groin, Mrs !
clochard: Cette petite merveille se trouve être un ancien modèle de téléphone très recherché…
clochard: Son design peut paraître grossier au premier abord, mais je vous garantis que la qualité de ce produit réside ailleurs…
clochard: Car oui !
clochard: Plus que pour appeler vos proches, vous pouvez casser des noix avec !
clochard: DES NOIX !
clochard: (Voir bien plus d'ailleurs…)
clochard: Alors ?
clochard:Il est à 89 oats .
clochard: On fait affaire ?
-> ClochardBoutique

++ [Achat]
{Argent >= 9:
clochard: Merci pour l'affaire !
clochard: N'allez pas vous cassez un doigt avec ...
~Materiaux = "Porkia33000"
~AchatPorkia = true
-> ClochardBoutique
}
clochard: Désolé,{~ j'crois que t'as pas les fonds ;| reviens quand tu seras plus ... Riche !| Je fais pas crédit ...}
-> ClochardBoutique

++ [Troque]
{Materiaux == "Porcium" / Materiaux == "Ciment" / Materiaux == "Gelée" / Materiaux == "SourceOG":
clochard: Marché conclue !
clochard: Je vous le troque contre votre {Materiaux} .
clochard: Merci pour l'affaire !
~Materiaux = "Porkia33000"
~AchatPorkia = true
-> ClochardBoutique
}
clochard: Je ne vois rien d'équivalent sur vous ...
clochard: Revenez quand vous aurez une affaire en béton !
-> ClochardBoutique

++ [Reposer l'objet]
clochard: {~Dommage...|Pas à votre goût ?|P’t’être une prochaine fois !}
clochard: Si vous changez d’avis...
-> ClochardBoutique

+ {AchatC4 == false} [C4]
**[Questioné]
clochard: Oula !
clochard: Faite attention avec ce pain…
matheo: Du pain?
matheo: Il n’est pas très appétissant…
clochard: Rassurez moi, il n’est pas toujours comme ça…
ruby: ... 
pico: Et bien ...
clochard: Si ?
clochard: Enfin peu m'importe, cette merveille tout droit sortie de nos frontières, pourrait vous démolir un chart d'assaut, ou bien labourer une parcelle en un temps record !
clochard: Je vous préviens, je ne suis en aucun cas fautif de vos agissements en ce qui concerne son utilisation !
clochard: Vous prenez quand même ?
clochard: C'est 56 oats.
-> ClochardBoutique

++ [Achat]
{Argent >= 5:
clochard: Merci pour l'affaire !
clochard: Si vous faite tout péter .
clochard: Je ne vous connais pas ...
~C4 = true
~ AchatC4 = true
-> ClochardBoutique
}
clochard: Désolé,{~ j'crois que t'as pas les fonds .| reviens quand tu seras plus ... Riche !| Je fais pas crédit ...}
-> ClochardBoutique

++ [Troque]
{SacCiment == true / LivreComptes == true:
clochard: Marché conclue !
clochard: Je vous le troque contre <>
{SacCiment == true} <> votre sac de ciment .
{LivreComptes == true} <> ce livre qui m'est familié ...
clochard: Merci pour l'affaire !
~C4 = true
~ AchatC4 = true
-> ClochardBoutique
}
clochard: Je ne vois rien d'équivalent sur vous ...
clochard: Revenez quand vous aurez une affaire en béton !
-> ClochardBoutique

++ [Reposer l'objet]
clochard: {~Dommage...|Pas à votre goût ?|P’t’être une prochaine fois !}
clochard: Si vous changez d’avis...
-> ClochardBoutique

+ {AchatBouteil == false} [Chateau la pompe du XVIIème]
{->BouteilDeClo1|->BouteilDeClo2|->BouteilDeClo3|->BouteilDeClo4|->BouteilDeClo5}

+ {AchatBoite == false} [Boîte à musique]
**[Questioné]
clochard: Une très belle pièce, je vous le dit !
clochard: Je ne saurais pas plus vous informer sur son origine…
clochard: Mais je crois que ça vient du Perault.
clochard: C’est une bonne affaire !
clochard: A seulement 44 oats !
-> ClochardBoutique

++[Achat]
{Argent >= 4:
clochard: Merci pour l'affaire !
ruby: Pas une seconde à perdre !
ruby: Comment on l'ouvre ?
clochard: Je sais pas moi ...
clochard: Je ne savais mêm pas qu'il y avait un contenu...
pico: Pas grave on se débrouillera ...
pico: Merci quand même !
clochard: ...
ruby: Aller on l'ouvre !
~ AchatBoite = true
~ ActivatePuzzle(true)
-> ClochardBoutique
}
clochard: Désolé,{~ j'crois que t'as pas un rond .| reviens quand tu seras plus ... Riche !| Je fais pas crédit ...}
-> ClochardBoutique

++[Troque]
clochard: Pourquoi pas...
{Lampe == true:
clochard: Je vois que vous avez une très belle lampe !
clochard: Si vous acceptiez de vous en séparer je...
legroupe: Oui !
clochard: Marché conclu !
ruby: Pas une seconde à perdre !
ruby: Comment on l'ouvre ?
clochard: Je sais pas moi ...
clochard: Je ne savais mêm pas qu'il y avait un contenu...
pico: Pas grave on se débrouillera ...
pico: Merci quand même !
clochard: ...
ruby: Aller on l'ouvre !
~ AchatBoite = true
~ ActivatePuzzle(true)
-> ClochardBoutique
-else:
clochard: Par contre je ne vois rien de valeur dans ce que vous transportez...
clochard: Revener me voir si vous trouvez quelque chose d'intéressant.
-> ClochardBoutique
}

++[Reposer l'objet]
clochard: {~Dommage...|Pas à votre goût ?|P't'être une prochaine fois !}
clochard: Si vous changer d'avis...
-> ClochardBoutique

+ [Vous désister]
clochard: Aucun problème!
clochard: Je serais toujours ouvert.
-> Clochard

=BouteilDeClo1
clochard: Cette bouteille ?
clochard: Désolé, pas à vendre…
clochard: C’est pour ma consommation personnelle, hé hé…
-> Clochard

=BouteilDeClo2
clochard: Puisque je vous dis qu’elle est pour moi !
clochard: C’est si dur à comprendre ?
-> Clochard

=BouteilDeClo3
clochard: Ok c’est bon…
clochard: Si vous la voulez tant que ça, va falloir y mettre le prix !
clochard: Cette bouteille est un précieux millésime que j’ai chour.!.
clochard: Qui m'a gracieusement été offert par Etchebacon, après lui avoir rendu un très gros service…
clochard: Alors ?
clochard: 112 oats .
clochard: Tu veux toujours l’acheter ?

++ [Achat]
{Argent >= 11:
clochard: Raaaa ...
clochard: Très bien elle est à vous .
clochard: Merci pour l'affaire ...
~AchatBouteil = true
~NbAlchool += 1
-> ClochardBoutique
}
clochard: T'es à sec vieux !
-> ClochardBoutique

*[Troque]
clochard: Non, je ne le troquerait pour rien au monde... (sauf de l'espèce)
-> BouteilDeClo3

+ [Reposer l'objet]
clochard: Non ?
clochard: Alors évite de me déranger pour rien...
-> ClochardBoutique

=BouteilDeClo4
clochard: NON MAIS SÉRIEUX ***** !
clochard: VOUS AVEZ PAS FINI DE ME FAIRE ***** !
clochard: ACHETER LE QU’ON EN FINISSE !

++ [Achat]
{Argent >= 11:
clochard: ENFIN !
clochard: Merci pour l'affaire !
clochard: Tssss ...
~AchatBouteil = true
~NbAlchool += 1
-> ClochardBoutique
}
clochard: T'ES TOUJOURS A SEC !
-> ClochardBoutique

*[Troque]
clochard: JE NE TROQUERAIT RIEN CONTRE !
-> BouteilDeClo4

+ [Reposer l'objet]
clochard: TU TE DECIDES OUI OU ****** !
-> ClochardBoutique

=BouteilDeClo5
clochard: ******* DE ******, FINI A LA ****** !
clochard: ****** *** *** *** *** ****** **** !
clochard: (Bois la bouteille cul sec)
clochard: Aher du brais nsgz le kalin ?
clochard: HEINNNNN !
clochard: ****** …
// Le clochard s'écroule bouré comme un coin…
~ ClodoKo = true
matheo: Eh regardez, un poivrot !
ruby: C'est pas drôle !
pico: Dede à une bien meilleur descente que lui ...
-> Clochard

=ParleCloclo1
pico: T’étais où ce matin ?
pico: J’t’ai cherché derrière le AuChamp, personne…
clochard: Trop de passage ce matin.
clochard: Ici, au moins, j’entends mes pensées.
pico: Moi, j’ai failli bosser ce matin
clochard: Toi ?
pico: Une meuf m’a proposé de l’aide pour un déménagement.
pico: J’ai dit ouais.
clochard: Et ?
pico: Bah j’suis tombé dans ses escaliers avant d’arriver.
clochard: C’est le destin qui t’a sauvé.
pico: Ouais… (ou mes lacets.)
clochard: Moi, j’ai eu une illumination aujourd’hui.
pico: Dis-moi ?
clochard: J’ai pensé monter un business de parapluie transparent pour chat d’appartement.
pico: Attends… quoi ?
clochard: “Ils ne sortent pas, mais faut les habituer au style de vie.”
pico: Mais mec… 
pico: Pourquoi t’es pas millionnaire ?
clochard: Parce que j’connaissais personne qui avait un chat et un compte en banque.
pico: T’es trop en avance sur ton temps.
clochard: Me fait pas rire.
-> Clochard

=ParleCloclo2
pico: Dit, c’est nouveau ça ?
clochard: Tu parles de cette boîte à musique ?
pico: Elle fonctionne ?
clochard: Pas du tout…
pico: Tu l’as depuis quand ?
clochard: Deux jours.
clochard: Je l’ai trouvée coincée derrière un vieux paravent, près de l'arrière cours d’chez l’antiquaire…
pico: Comme toi, un peu.
clochard: Ha ha ha !
clochard: Elle est bien bonne!
clochard: Allez tiens.
pico: Hein ?
clochard: Prends-la.
clochard: De toute façon je ne pourrais surement pas la vendre en l’état… (en plus c’est du toc)
pico: Merci bro!
clochard: Et si quelqu’un demande d’où elle vient… tu dis que tu l’as trouvée.
~ ActivatePuzzle(true)
-> Clochard

=ParleCloclo3
pico: T’as eu d’autres trésors comme ça ?
clochard: J’ai eu une horloge, un jour.
clochard: Très belle.
pico: Elle marchait ?
clochard: Elle courait même!
Mathéo: Sérieux !?!
clochard: Non…
clochard: Elle n'avait pas d’aiguilles, mais j’la vendais comme “conceptuelle”.
pico: T’es un artiste, en fait.
clochard: Disons que je pourrais te vendre du sable en plein désert !
clochard: En tout cas, ces discussions m'ont fait un bien fou !
clochard: Tien, pour ta peine ...
pico: Merci pour la bière bro !
clochard: Faut bien se serrer les coudes entre colègue !
pico: ...
ruby: Pfft ... (un vraie clochard !)
-> Clochard

=ParleCloclo4
pico: Un vrai receleur…
clochard: Tu l'as dit !
clochard: N’hésite pas à me dire si quelque chose te tape à l'œil…
-> ClochardBoutique

=ParleMath1
matheo: Tiens ?
matheo: La municipalité n'a pas encore jeté les ordures ?
clochard: J’ai pas plus bougé que tes deux neurones depuis la maternelle fiston...
matheo: Ah ouais !
matheo: Hé bien, les poubelles du coin ont de la répartie à ce que je vois ...
~ColèreClodo += 1
-> Clochard

=ParleMath2
clochard: Toujours avec ta coupe de cheveux de patron de salle de sport fictive.
matheo: J’plais à tout le monde.
matheo: Moi !.
clochard: Tu plais surtout à ton miroir.
clochard: Et encore, il doit craquer sous la pression.
~ColèreClodo += 1
-> Clochard

=ParleMath3
matheo: Tu veux un selfie ou un autographe ?
clochard: Je veux un miracle !
clochard: Genre, une minute sans t’entendre !
matheo: Je suis ce que t’auras jamais.
clochard: Ouais ...
clochard: Une tête vide !
clochard: Avec une merde dessus !
clochard: !?! …
~ColèreClodo += 1
-> Clochard

=ParleMath4
matheo: T’es juste aigri parce que j’ai tout ce que t’as pas.
clochard: Ouais, t’as raison.
clochard: J’ai pas ton QI de frigo débranché…
matheo: Tu dis ça parce que t’as jamais été à mon niveau.
clochard: Ton niveau ?
clochard: IL EST À LA HAUTEUR DU TROTTOIRE TON NIVEAU !
clochard: C’EST P'T’ÊTRE POUR ÇA QUE JE TE VOIS SOUVENT !
matheo: RETOURNE MANGER DES POUBELLES TOI !
~ColèreClodo += 1
-> Clochard

=ParleMath5
clochard: TU ME CHERCHES C’EST CA !?!
clochard: TU ME CHERCHES !?!
matheo: OUI !
clochard: VAS-Y J’T’ATTEND !
~ColèreClodo += 1
-> MathAttaqueClo

=MathAttaqueClo
{ClodoKo == false:
    {ColèreClodo <= 5:
    clochard: T’approche pas…
    clochard: T'APROCHE PAS J’AI DIT !
    matheo: Il est grand temps de jeter les ordures !
    - else:
    clochard: VAS-Y !
    clochard: APPROCHE MON COCHON !
    matheo: PAS BESOIN DE ME LE DIRE DEUX FOIS ! 
    // Mise à tabac
    ~clochardstate = "tabac"
    }
    {ClodoKo == false:
    clochard: Ghhe, pftu bra’le payer fther…
    clochard: ***** !
    // S'écroule inconscient
    ~ClodoKo = true
    }
}
{ClodoKo == true:
// Frappe un coup
{NNFrappe == 9} // *Shoryu-Ken !*
{NNFrappe == 10} // *Hadoken !*
matheo:{Il à déjà eu son compte…|Bon, juste un coup de plus ...|C’est drôle en fait !|Un pour Pico ...|Un pour Ruby ...|Un pour Moi ...|Un pour le chien de la voisine ...|Shoryu-Ken !|Hadoken !}
    ~NNFrappe += 1
    {NNFrappe >= 10:
    matheo: Un pour...
    pico: C'est bon, STOP!
    pico: A force il va devenir bleu !
    pico: C'est pas un sac de frappe !
    ruby: Après, il l'avait un peu cherché...
    // Frappe un coup, bruis visqueu rapide (Brutality ?)
    matheo: Ha ! ...
    matheo: Je crois qu'il vient d'perdre les os ...
    pico: ... (Non mais c'est pas possible !)
    ruby: ... 
    }
}
-> Clochard

== Ruine ==

+ [Fouiller les ruines] Avec ?
    ** {LivreComptes == false} [Pico] 
        pico: Hoho !
        pico: Mais c’est la planque du clodo, ça.
        pico: (Y une bouteille à moitié pleine !)
        // *glou glou glou*
        pico: Ahhh...
        pico: Ca c’est de l’essence de bonheur...
        pico: Mmm ? 
        pico: C’est quoi ce vieux machin moisi ?
        pico: “L’enfance des trois petits cochons”... ?
        // *feuillte les pages*
        pico: Trop chelou l'histoire !
        pico: Mais c'est rempli d'indice pour survivre...
        pico: Je prends, si ça a marché pour eux...
        pico: Ca devrait marcher pour nous aussi !
        ~ NbAlchool += 1
        ~ LivreComptes = true
        ~ NBaction -= 1
        -> Ruine
        
    ** {LivreComptes == true} [Pico]
        pico: C’est bon, j’ai déjà vidé le mini-bar et pris le bouquin.
            pico: Plus rien ici à part des camlots.
        ~ NBaction -= 1
        -> Ruine
    
    ** {NoGlasse == false} [Ruby] 
        ruby: Doit bien y avoir des objets électroniques cassés que je peux récupérer ici…
        // *avance prudemment… glisse sur une brique*
        ruby: OAAAHHH !
        // *s’écrase au sol, bruit de plastique qui craque*
        ruby: … oh non…
        ruby: MES LUNETTES !
        ruby: Super… je vois plus rien…
        matheo: Bouffonne !
        ruby: ...En vrai bien vu.
        ~ NoGlasse = true
        ~ NBaction -= 1
        -> Ruine
            
    ** {NoGlasse == true} [Ruby]
        ruby: J’ai déjà tout fouillé.
        ruby: Et mes lunettes sont toujours mortes.
        ~ NBaction -= 1
        -> Ruine

    ++ [Mathéo] 
        {SacCiment == false:
            matheo: Hmm…
            matheo: Un sac ?
            matheo: Ah ouais, du ciment !
            matheo: Parfait pour entrainer les dorceaux.
            ruby: Ou construire un abri ... (banane !)
            matheo: J’le garde.
            ~ SacCiment = true
            ~ Materiaux += "Ciment"
            ~ NBaction -= 1
        - else:
            matheo: Rien d’autre à foutre ici à part jongler avec les décombres...
            ~ NBaction -= 1
        }
    -> Ruine

+ {porteOuverte == false} [Ouvrir la porte] Avec ?
        
    ** {C4 == true} [Pico]
        pico: Hmm… 
        pico: Cette porte a pas l’air très fan des visites.
        pico: On va lui faire une petite surprise.
        // *sort son C4, colle ça au mur comme un chef*
        pico: FIRE IN THE HOLE !
        // *explosion sourde – le mur s’écroule*
        pico: Le mur est mort, mais la porte est intacte.
        ruby: Y a que la porte qui est intacte gros malin...
        pico: Hehem, je...
        pico: Je prends la porte !
        pico: Voilà quelque chose qui pourrait résister à n'importe quel choc !
        ~ porteOuverte = true
        ~ Materiaux += "Porte"
        ~ NBaction -= 1
        -> Ruine
            
    ** {C4 == false} [Pico]
        pico: Cette porte est plus têtue qu’un cochon à jeun…
        pico: Si je picole un peu, j’pourrais peut-être oublier qu'elle est fermée ?
        ~ NBaction -= 1
    -> Ruine
        
    ** {IPad == true} [Ruby]
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
        ~ NBaction -= 1
        -> Ruine
            
    ** {IPad == false} [Ruby]
        ruby: Une porte blindée ?
        ruby: Avec un bon hack, mais j’ai oublié mon iPad.
        ruby: Super...
        ~ NBaction -= 1
        -> Ruine
        
    ** {RedPig == true} [Mathéo]
        matheo: Cette porte fait trop la fière !
        matheo: Je vaislui montrer ce que vaut le grand Mathéo, après avoir chargé les batteries !
        matheo: YAAAAAH !
        // *fonce sur la porte à pleine puissance*
        // *le battant vibre, puis cède dans un grand fracas métallique*
        matheo: C’est qui le patron ?
        matheo: Hmm ?
        matheo: Une lampe ?
        matheo: Je prend .
        ~ porteOuverte = true
        ~ Lampe = true
        ~ NBaction -= 1
        -> Ruine
            
    ** {RedPig == false} [Mathéo]
        matheo: Je vais l’ouvrir à l’ancienne...
        // *Choc violament sourd*
        matheo: ...ou pas.
        matheo: J’suis trop à sec.
        matheo: Avec une Red Pig, j’lui explose les gonds, c'est sûr !
        ~ NBaction -= 1
        -> Ruine
            
    
    // *choque voilent*
    matheo: {Drolement solide comme porte !|J'ai pas dit mon dernier mot ...|Encore un coup !}
    pico: {Abandone !!!|On perd du temps là !|C'est bon t'a fini ?}
    ~ NBaction -= 1
    -> Ruine
 
+ [Sortir des ruines]
~ NBaction -= 1
-> ActionPrincipale

== Puit ==

+ {PlusDSaut == false} [Prendre de l'eau] Avec ?
    ** [Pico]
        pico: (On va chercher l’eau tranquillement...)
        // remonte le seau*
        pico: Et voilà ! 
        matheo: Rien d'étrange ?
        pico: Non...
        pico: Tu t'attendais à quoi ?
        ~ Eau = true
        ~ NBaction -= 1
        -> Puit

    ** [Ruby]
        ruby: Récupérer de l’eau ? (Easy!)
        // *envoie le seau au fond*
        ruby: Et beh il est profond...
        ruby: Allez !
        // *rougit, force, s’écroule*
        ruby: FUTAIN DE MERLE !
        mathéo: Bouffonne.
        ruby: Vas-y, essaye pour voir ?
        ~ NBaction -= 1
        -> Puit

    ** [Mathéo]
        matheo: (OK let's go, comme à la salle...)
        // *tire d’un coup sec, le seau s’envole, disparaît dans les airs*
        matheo: Euh... j'ai peut-être tiré un peu fort.
        ruby: Bravo !
        ruby: On fait comment maintenant ?
        ~ PlusDSaut = true
        ~ NBaction -= 1
        -> Puit
        
+ [Parler au puits] Avec ?

    { picoDansPuits && rubyDansPuits && mathéoDansPuits:
        ** [Pico]
            pico: Super, on est trois ! 
            pico: C’est le puits-party !
            puits: C’était mieux quand j’étais seul !...
            ~ NBaction -= 1
            -> Puit

        ** [Ruby]
            pico: (Bon, autant y aller à la force maintenant...)
            pico: Donne ta main, Mathéo !
            matheo: YAAAAAAAA ! Allez, à toi Ruby !
            ruby: J'arrive...
            pico: Mathéo, ne recommence plus ça, compris ?
            pico: Ta bétise nous aura fais paumer un paquet de temps !
            mathéo: Mais oui, mais oui...
            puits: Vous avez pas oublier quelqu’un ?
            pico:...
            matheo:...
            ruby:...
            ~ picoDansPuits = false
            ~ rubyDansPuits = false
            ~ mathéoDansPuits = false
            ~ NBaction -= 3
            -> Puit

        ** [Mathéo]
            matheo: On va s’en sortir, allez, tous ensemble !
            puits: Vous êtes lourds...
            puits: LOURDS !
            ~ NBaction -= 1
            -> Puit
    }

    { picoDansPuits && rubyDansPuits && !mathéoDansPuits:
        ** [Pico]
            pico: MATHÉO GROS BÂTARD !
            pico: REMONTE-NOUS !
            puits: Il a l’air d’être du genre à "agir avant de réfléchir", non ?
            ~ NBaction -= 1
            -> Puit

        ** [Ruby]
            ruby: MATHÉO ! 
            ruby: AIDE-NOUS À SORTIR D’ICI TOUT E SUITE !
            puits: Vous êtes deux maintenant ?!
            puits: C’est pas une colocation ici...
            ~ NBaction -= 1
            -> Puit

        ** [Mathéo]
            matheo: Allez, j’vous remonte...
            // *force un peu trop*
            matheo: AAAAAAH !!
            // *Plouf*
            puits: On est un quatuor maintenant ! (Misère...)
            ~ mathéoDansPuits = true
            ~ NBaction -= 1
            -> Puit
    }

    { picoDansPuits && !rubyDansPuits && !mathéoDansPuits:
        ** [Pico]
            pico: Remontez-moi, bordel !
            pico: Y’a un gars chelou ici !
            puits: J’préfère "personne mystérieuse", merci.
            -> Puit

        ** [Ruby]
            ruby: Pico ?!
            pico: Remonte-moi ! 
            pico: J’suis pas une truite !
            puits: Elle a l’air plus fiable que toi, ça me rassure.
            ruby: Mathéo, aide-le !
            matheo: Demande le moi plus gentillement, merci !
            puits: Ha ...
            ruby: Mais quesque tu .?!
            ruby: Haaaa !
            // *Plouf*
            ~ rubyDansPuits = true
            ~ NBaction -= 1
            -> Puit

        ** [Mathéo]
            pico: Va te faire foutre et aide-moi !
            matheo: Hahahaha !
            matheo: Grosse merde, ahahahah !
            puits: Ce lien fraternel est très... 
            pico: Bancale... ?
            puits: Touchant !
            puits: J'allais dire touchant...
            ~ NBaction -= 1
            -> Puit
    }

    { connaissentPuits && !picoDansPuits :
        ** [Pico]
            pico: T’as de l’alcool là-dedans ?
            puits: Que du désespoir et des souvenirs d’enfance.
            pico: Pff... 
            pico: Un Ricard aurait été plus utile !
            ~ NBaction -= 1
            -> Puit

        ** [Ruby]
            ruby: C’est qui là-dedans ?
            puits: Un cochon... un écho... un regret.
            ruby: T’es pas un peu drama-queen sur les bords toi ?
            ~ NBaction -= 1
            -> Puit

        ** [Mathéo]
            matheo: Tu veux sortir ?
            puits: Évidemment !
            matheo: Et moi j’veux une Switch !
            matheo: On a tous des rêves.
            puits: Toi, t’es pire que mon karma...
            ~ NBaction -= 1
            -> Puit
    }

    { picoDansPuits == false && !connaissentPuits:
        ** [Pico]
            pico: Oh, t’as soif, le puits ?
            puits: Si c'est pas de l'eau, ouais, donne un peu !
            pico: Tiens atra...
            // *plouf*
            puits: Hah !
            puits: Un nouveau colocataire !
            ~ picoDansPuits = true
            ~ connaissentPuits = true
            ~ NBaction -= 1
            -> Puit

        ** [Ruby]
            puits: Hé, pssst ...
            ruby: (J’entends... une voix ?)
            puits: Tu m'entends ?
            ruby: C’est quoi ce délire...
            puits: Tu peux aussi me parler si tu veux ?
            ruby: !?!
            ~ connaissentPuits = true
            ~ NBaction -= 1
            -> Puit

        ** [Mathéo]
            matheo: Salut, ça va ?
            puits: Ça va... ça va... ça va...
            matheo: (On dirait un vieux sénile de 67 ans qui s'est fait quitté par sa femme y'a deux semaines et qui est en conflit avec l’Urssaf.)
            puits: Que...
            puits: Tu serais pas mon ex-beau-fils ?
            ~ connaissentPuits = true
            ~ NBaction -= 1
            -> Puit
    }
        
        pico: J'ai pas tres envie de continuer la conversation, et vous ?
        ruby: Non .
        matheo: Tout pareil ...
        ~ NBaction -= 1
        -> Puit

+ {C4 == true} [Faire exploser le puits] Avec ?

    ** [Pico]
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
        pico: Y a des cristeaux chelou qui en sont sortis...
        ~ C4 = false
        ~ Materiaux = "Porcium"
        ~ NBaction -= 1
        -> Puit

    ** [Ruby]
        ruby: Pico vient de... mais il est con ou... ?
        // *BOOM*
        puits: AAAH mes articulations !
        ruby: Miskine...
        pico: Voilà !
        pico: Puits, t’es sauvé ou t’es mort, on verra bi...
        ruby: T'EST UN PUTAIN D'INCONCIENT PICO !
        pico: Ouais c'est ça...
        pico: Regarde plutôt !
        pico: Y a des cristeaux chelou qui en sont sortis...
        ~ C4 = false
        ~ Materiaux = "Porcium"
        ~ NBaction -= 1
        -> Puit

    ** [Mathéo]
        matheo: T’es vraiment un débile profond mec ...
        pico: De quoi tu me parles ?
        pico: T'as une autre idée ?
        matheo: Non ...
        pico: Bah voilà !
        puits: J’vous déteste ...
        // *BOOM*
        ruby: (On a détruit le patrimoine local...)
        matheo: Cool ...
        matheo: Regarde Pico !
        matheo: Y a des cailloux partout maintenant ...
        pico: Ca peut sûrement servir pour la cave !
        pico: Prends les .
        ~ C4 = false
        ~ Materiaux = "Porcium"
        ~ NBaction -= 1
        -> Puit

+ [Partir]
-> ActionPrincipale

== Mairie ==
~ show ("daridle")
darone: Ah tiens, vous êtes encore venus faire les imbéciles ici ?

-> mairie_menu

= mairie_menu

+ [Parler à la secrétaire] Avec ?
    ** [Pico]
        pico: Bonjour, je viens faire une petite formalité.
        secretaire: Oui ? ...
        pico: J’aimerais faire un prêt de 1 milliard de oats s’il vous plaît.
        secretaire: ...Ceci est une mairie, pas une banque.
        secretaire: Quand bien même..., vous n’avez pas l’air solvable.
        pico: Vous allez me le faire ce prêt ou je vais porter plainte !
        secretaire: Vous pouvez aussi sortir discrètement par la gauche avant que j'appelle la sécurité...
        pico: Hmmm...
        pico: Je reviendrai avec un avocat !
        secretaire: sécurité...
        pico: Ok, ok...
        ~ NBaction -= 1
        -> mairie_menu

    ** [Ruby]
        ruby: Bonjour !
        ruby: J’aimerais changer un truc hyper important.
        secretaire: Une adresse ?
        secretaire: Un état civil ?
        ruby: Non, mon blaze.
        ruby: “Ruby”, c’est dépassé.
        ruby: Appelez-moi "Xx_Dark_Wolf_Killer_69_xX".
        secretaire: …Très bien. (Les jeunes...)
        secretaire: “Xx_Dark_Wolf_Killer_69_xX” ...
        secretaire: Vous signez ici, là…
        secretaire: Et là..., voilà !
        ruby: Trop stylé.
        ~ ruby_nom = "Xx_Dark_Wolf_Killer_69_xX"
        ~ NBaction -= 1
        -> mairie_menu

    ** [Mathéo]
        matheo: Madame la secrétaire.
        matheo: J’aimerais lancer une procédure d’expulsion contre un indésirable.
        secretaire: Quel est le motif de la demande ?
        matheo: Il sent mauvais.
        matheo: Il regarde bizarrement.
        matheo: Et il squate les voies publiques.
        secretaire:... Je note.
        ~ Expulsion = true
        ~ NBaction -= 1
    -> mairie_menu

+ [Parler à leur mère] Avec ?
    ** [Pico]
        pico: Bonjour maman !
        ~ show ("darangry")
        darone: PICO !!!
        darone: Tu pues l'alcool !
        darone: T’es encore torché ?!
        darone: Je t’ai dit de pas traîner avec ta fratrie si tu bois comme un tonneau !
        pico: C’est bon Maman...
        ~ show ("daridle")
        darone: Bon...
        darone: Qu’est-ce que vous voulez encore ?
        pico: Tu n'aurais pas la clé de la cave ?
        ~ show ("darangry")
        darone: Non, et même si je l'avais, je ne te la donnerais pas !
        pico: Maman, c'est pour notre survie !
        darone: C'est sutout pour tout siffler !
        ~ show ("daridle")
        darone: C'est bien pour toi que je l'ai fermé à clé .
        ~ NBaction -= 1
        -> mairie_menu

    ++ {connai_boite == false} [Ruby]
        ruby: Maman, c’est grave !
        ruby: Y’a une BOMBE qui va tomber sur le village !
        ruby: On a besoin de la cave, tout de suite !!
        darone: Oh Ruby, quelle surprise de te voir bouger pour autre chose que ton <>
        ~ show ("darangry")
        darone: <> PC !
        ~ show ("daridle")
        darone: …La cave ? 
        darone: Ça fait un moment que j’ai perdue la clé...
        ~ show ("darasking")
        darone: Il me semble qu’elle était dans une boîte à musique…
        darone: Mais je l’ai vendue à l'antiquaire ou un collectionneur, je sais plus...
        ~ show ("daridle")
        ruby: Super ! 
        ruby: Donc on doit retrouver une boîte random !
        ruby: Vendue à un random !
        ruby: Dans un lieu random !
        ruby: J’espère qu’elle est pas gardée par un SDF ou un mec débile ...
        ~ connai_boite = true
        ~ NBaction -= 1
        -> mairie_menu

    ++ {connai_boite == true} [Ruby]
        ruby: Tu peux me répéter au sujet de la boîte ?
        darone: Je l’ai vendue à l'antiquaire ou...
        ruby: Merci maman !
        darone: ... ?! (Ils vont me tuer à courir partout...)
        ~ NBaction -= 1
        -> mairie_menu

    ** [Mathéo]
        matheo: M’man… t’as la clé de la cave ?
        ~ show ("daridle")
        darone: Non .
        matheo: …Ok .
        ~ NBaction -= 1
        -> mairie_menu
        

+ {voiture_accident == false} [Voler la voiture du maire] Avec ?
    ** [Pico] 
        pico: Héhé, opération "Grand Tour" commence !
        // *Titube jusqu’à la voiture, entre par effraction*
        pico: C’est ouvert !
        pico: Alors, ou est le démareur ...
        // Bruit de moteur. Puis… *CRAAAAAASH*
        pico: WOUHOUU—OUPS.
        darone: C’ÉTAIT QUOI !?!
        darone: LA VOITURE DU MAIRE !
        darone: PICO !!!
        secretaire: …Et voilà. Encore un rapport à rédiger.
        ~ voiture_accident = true
        ~ NBaction -= 1
        -> mairie_menu

    ** [Ruby]
        ruby: Je vais m’y prendre comme d’habitude…
        ruby: *Connecte son téléphone au tableau de bord via une appli douteuse*
        ruby: Et... BINGO, accès obtenu !
        ruby: *Monte, regarde les pédales, panique un peu*
        ruby: ... Je sais pas conduire, en fait.
        matheo: Bou—
        ruby: NON.
        matheo: —fonne !
        ruby: *Soupir exaspéré, descend et claque la porte*
        secretaire: Veuillez ne pas forcer les véhicules de fonction, merci.
        ~ NBaction -= 1
        -> mairie_menu

    ** [Mathéo] 
        matheo: Voyons voir cette belle bagnole.
        matheo: *Essaie d’ouvrir la portière, mais l’arrache complètement*
        matheo: Oups.
        matheo: Bon, au moins j’ai du bon métal là-dedans.
        matheo: “CochoMobile” en matériaux, validé !
        secretaire: Monsieur ?! Vous... vous avez VOLÉ une portière ?
        matheo: Je préfère dire “prélevé une ressource”.
        ~ voiture_accident = true
        ~ Materiaux = "CochoMobile"
        ~ NBaction -= 1
        -> mairie_menu

+ [Sortir de la Mairie]
~ show ("daridle")
darone: Faites pas trop les cons dehors !
secretaire: Revenez quand vous voulez (mais pas trop souvent ...)
~ NBaction -= 1
-> ActionPrincipale

== AuChamp ==
~ fadeBg("auchamp", 0.5)
~ show ("pieridle")
+ [Parler à Pierre] Avec ?
    ** [Pico]
    pico: Salut Pierre, t'as des six packs en stock ?
   ~ show ("pierhappy")
    pierre: Évidemment !
    ~ show ("pieridle")
    pierre: Chez moi, c’est XXL ou rien.
    pico: J’te kiffe.
    ~ NBaction -= 1
    ~ NbAlchool += 1
    ~ Argent += -1
    -> AuChamp

    ** [Ruby]
    ruby: Euh... salut… (C’est quoi cette tête de fou malade ?)
    ~ show ("pierhappy")
    pierre: Bien le bonjour babygirl .
    pierre: (Est-ce que ton père travaille chez Nintendo ?)
    pierre: (Parce que t’es une DéeSse.)
    ~ show ("pierasking")
    pierre: Rouge Rubis...
    ruby: ?!
    pierre: Ton père a volé tous les rubis de la grotte pour les mettre in your eyes...
    // *insère tout le poème complet ici...*
    ruby: (Je vais exploser de gêne...)
    ~ Materiaux = "Rigolofleur"
    ~ NBaction -= 1
    -> AuChamp

    ** [Mathéo]
    matheo: Dit donc Pierre, t'es tarpin grand à regarder de plus près ...
    matheo: Tu dois avoir une génétique de fou furieux pour la salle.
    ~ show ("pierhappy")
    pierre: Haha ouais, je peux te soulever carrément tu connais .
    matheo: Ah ouais ... <>
    <>ça vie ici !
    ~ NBaction -= 1
    -> AuChamp
    
    
    pierre: Bon ...
    pierre: C'est pas que je ne vous apprécie pas .
    pierre: Mais j'ai plus rien à vous dire ...
    ~ NBaction -= 1
    -> AuChamp

+ [Explorer le magasin] Avec ?
    ** [Pico]
    pico: C’est moi ou il y a une promo sur tout ce qui sert à rien ?
    pico: OOOOH ils ont des Boom Box !
    pico: JE VAIS FAIRE LE MUR DU SON !
    pico: Ruby !!
    pico: C’est moi qui vais avoir la place du génie maintenant !
    ruby: (Normalement je devrais être exténuée par cette idée, mais pourquoi pas lui faire confiance...)
    ruby: C'est super !
    ruby: Bien joué...
    ~ Materiaux = "Enceinte"
    ~ NBaction -= 1
    -> AuChamp

    ** [Ruby]
    ruby: (Je sais pas si Pierre va se dire à un moment que je me suis rendu compte qu’il me regarde en se cachant derrière les rayons...)
    ruby: (Il me met trop mal à l’aise...)
    ruby: (J’arrive pas à me concentrer.)
    ~ show ("pieridle")
    pierre: (Elle m’a toujours pas remarqué... héhé...)
    ~ NBaction -= 1
    -> AuChamp

    ** [Mathéo]
    matheo: ...
    matheo: Cette pub... (trop hypnotisante...)
    ruby: (Il est resté bloqué sur un écran figé pendant plus de 10 minutes...)
    ruby: C’est grave...
    pico: Tu l'as dit...
    ~ NBaction -= 1
    -> AuChamp
    
    
    ruby: On peux partire maintenant ?
    ruby: On a de quoi se défendre là !
    ruby: Je le sens m'observer ...
    ~ NBaction -= 1
    -> AuChamp

+ {ChopeParPierre == false} [Fouiller le bureau de Pierre] Avec ?
    ** [Pico]
    pico: Ohoh... 
    pico: Y'a un tiroir là !
    // *cling cling*... *bam*
    ~ show ("pierasking")
    pierre: Qu’est-ce tu fous là !?
    pico: Euuuuh... 
    pico: j’me suis perdu ?
    ~ show ("pieridle")
    pierre: Dégage de là, t'as rien à faire ici ...
    ~ ChopeParPierre = true
    ~ NBaction -= 1
    -> AuChamp

    ** [Ruby]
    ruby: Voyons voir… 
    ruby: C'est son ordi ? (Un peu vieillot, mais c'est dans mes cordes !)
    ruby: Voyon voir...
    // pianote sur le clavier
    ruby: Voilà, qu’est-ce que vous feriez sans mes talents de hackeuse professionnelle !
    ruby: Oh non... (je m’en doutais TELLEMENT pas ...)
    ruby: Pierre est un loup .
    matheo: Un loup ?
    ruby: Oui, un loup espion...
    pico:  Comme papa .
    matheo: Ca explique sa carrure de BG ...
    ruby: C’est pour ça qu’il me tourne autour ? 
    ruby: Il veut me croquer !
    matheo: Mais... 
    matheo: Il ressemble pas à un loup, si ?
    ruby: ...
    pico: ...
    ~ NBaction -= 1
    -> AuChamp

    ** [Mathéo]
    matheo: Hmm... 
    // cling cling, bruit de pièces
    ~ show ("pierasking")
    pierre: Qu’est-ce que tu cherches là !?
    matheo: Je... je... 
    matheo: Le secret de ta force ?
    ~ show ("pieridle")
    pierre: Tu es sérieux ?
    matheo: Oui ?
    ~ show ("piersad")
    pierre: (Il est sérieux...) 
    ~ show ("pieridle")
    pierre: C'est pas là que tu auras ta réponsse...
    pierre: Sors...
    ~ ChopeParPierre = true
    ~ NBaction -= 1
    -> AuChamp

+ [Sortir du Au Champ]
~ NBaction -= 1
-> ActionPrincipale

== Restaurant ==
~ fadeBg("restaurant", 0.5)
~ show ("chefidle")
"Texte d'introduction au restaurant" {~texte 1|texte 2|texte 3}
+ [Parler à Elshebacon] Avec ?
    ** [Pico]
    chef: Bonjour mon grand !
    chef: Qu’est-ce qui t'amène ici ?
    ~ show ("chefhappy")
    chef: Tu viens parler cuisine avec moi ?
    ~ show ("chefidle")
    pico: Parler cuisine ?
    pico: J’adore cuisiner et boire moi ! 
    pico: Surtout boire !
    ~ show ("chefhappy")
    chef: Super alors ! 
    chef: Ça te dirait de cuisiner avec moi ?
    pico: J’ai trop faim, je veux bien !
    ~ show ("chefidle")
    chef: Très bien alors ! 
    ~ show ("chefasking")
    chef: C’est une recette un peu expérimentale à base de gelée, jamais essayée...
    ~ show ("chefhappy")
    chef: Mais ça va faire un carton dans mon restaurant !
    pico: Y aura de l’alcool dedans ?
    ~ show ("chefidle")
    chef: J’en sais rien, on verra !
    // CUISINE TIME !
    ~ show ("chefhappy")
    chef: Et voilà le travail !
    ~ show ("chefidle")
    chef: Qu'en penses-tu ?
    pico: C’est... gluant...
    pico: Sans vraiment de goût...
    pico: Et encore moins d’alcool !
    ~ show ("chefasking")
    chef: Vraiment ?
    ~ show ("chefsad")
    chef: Bon, j’en referai pas...
    ~ show ("chefhappy")
    chef: Mais au moins, j’aurai essayé !
    pico: Et le reste de gelée ?
    ~ show ("chefidle")
    chef: Tu sais quoi ?
    ~ show ("chefhappy")
    chef: Je te le donne.
    ~ show ("chefidle")
    chef: Ça me sert plus à rien !
    pico: Merci Chef !
    ~ Materiaux = "Gelée"
    ~ NBaction -= 1
    -> Restaurant
    
    ** { RubyDehors == false} [Ruby] 
    chef: Bonjour ma grande !
    chef: Qu’est-ce qui t’amène ici ?
    ~ show ("chefhappy")
    chef: Tu viens parler cuisine avec moi ?
    ~ show ("chefidle")
    ruby: non je cuisine pas
    chef: Tu ne cuisines pas ?!
    ~ show ("chefasking")
    chef: Mais comment tu fais pour te nourrir ?
    ruby: Pastabox ! hihihihi
    ~ show ("chefidle")
    chef: Des nouilles instantanées ?!
    ~ show ("chefangry")
    chef: TU TE MOQUES DE MOI ?!
    ruby: c’est très bon, tg !
    chef: TU N’AS AUCUN GOÛT !
    chef: HORS DE MA VUE !
    ruby: ok
    ~RubyDehors = true 
    ~ NBaction -= 1
    -> Restaurant

    ** [Mathéo]
    ~ show ("chefhappy")
    chef: Ah Mathéo, comment ça va ?
    ~ show ("chefidle")
    chef: Tu ne travailles pas aujourd’hui pourtant ?
    chef: Tu viens faire des heures sup ?
    matheo: je sais pas, j’accompagne mon frère et ma sœur au restaurant
    ~ show ("chefhappy")
    chef: Dit-leur de venir me voir !
    ~ show ("chefidle")
    chef: Je suis sûr qu’on pourrait bien s’entendre !
    ~ NBaction -= 1
    -> Restaurant
    
    
    matheo: {On devrait pas plus le déranger ...|Non, vraiment !|Bouffon(ne) ... }
    -> Restaurant

* [Commander à boire] Avec ?
    ** [Pico]
    pico: Je voudrais du Pastis pour nous trois, c’est ma tournée !
    ~ show ("chefhappy")
    chef: Très bien, 3 pastis pour la 8 !
    ~ hide ("chefhappy")
    // ILS ONT SERVI LE TRUC
    pico: Super ! (Cul sec !)
    ruby: Wow, il est fort cet alcool...
    matheo: Eeuuurrrk c’est pas bon 
    // il recrache sur Ruby
    ruby: HE!
    ruby: Tu nous fais quoi là ?!
    matheo: Hahahaha !
    ruby: J'en est partout !
    ruby: Nique ta mère fjeuzfphnuezdnjierjiee...
    matheo: C'est la tiène aussi !
    ruby: Je ...
    matheo: Bouffone...
    ~NbAlchool += 1
    ~ NBaction -= 1
    -> Restaurant
    
    ** [Ruby]
    { RubyDehors == false:
    ruby: Café, café! ouh ouh ouh...
    chef: Du café ?
    ~ show ("chefasking")
    chef: Mais vous n’avez même pas pris de repas...
    ruby: Et ?
    ~ show ("chefidle")
    chef: Très bien..., 3 cafés pour la 8 !
    ~ hide ("chefidle")
    // ILS ONT SERVI LE TRUC
    pico: Je passe mon tours ...
    pico: C'est pas ma came.
    matheo: Eeuuuk, c’est trop amer... 
    ruby: Vous ne buvez pas ?
    pico: Non, je passe mon tours.
    matheo: Plus jamais...
    ruby: Super, plus pour moi !
    pico: Arrête on sait tous comment tu réagis avec trop de caféi...
    matheo: Trop tard, elle a tout sifflé...
    ~Cafeine = true
    -else:
    ~ show ("chefangry")
    Chef: {~ENCORE TOI ?!|JE T'AVAIS DIT DE NE PAS REVENIR !|DÉGUERPIS !}
    // Claque la porte violament
    }
    ~ NBaction -= 1
    -> Restaurant
        
    ** [Mathéo]
    ~ show ("chefhappy")
    chef: Ah Mathéo, tu viens te restaurer ?
    matheo: Nan, j’veux juste à boire.
    ~ show ("chefidle")
    chef: Même pas un apéro ?
    matheo: Non, tu me connais...
    chef: Très bien, 3 boissons énergisantes pour la 8 !
    ~ hide ("chefidle")
    // ILS ONT SERVI LE TRUC
    pico: C'est pas mauvais, mais c'est pas alcoolisé...
    ruby: C'est épais comme de la soupe...
    ruby: (Je préfèrais plus siroter un café !)
    matheo: HaaaAA ! 
    matheo: Je me sens revigoré.
    matheo: Je pourrais faire du développer avec un semiremorque !
    ruby: (Pt'être pas quand même...)
    ~ RedPig = true
    ~ NBaction -= 1
    -> Restaurant

+ [Rendre service] Avec ?
    ** [Pico]
    pico: Bonjour m’sieur !
    chef: Tu as besoin de quelque chose ?
    pico: J’ai besoin d’argent, l’alcool me coûte cher…
    ~ show ("chefhappy")
    chef: Ah, tu veux bosser ?
    ~ show ("chefidle")
    chef: File en cuisine, j’ai besoin d’aide !
    // ILS ONT CUISINÉ
    ~ show ("chefhappy")
    chef: Merci pour ton aide, ce sera tout pour aujourd'hui.
    ~ show ("chefidle")
    chef: Voilà ta paye "avec un supplément" !
    pico: À moi l’alcool !
    ~Argent += 2
    ~NbAlchool += 1
    ~ NBaction -= 1
    -> Restaurant
        
    ** {RubyDehors == false} [Ruby]
    ruby: Bonjour monsieur!
    chef: bonjour ma grande, tu cherches quelque chose ?
    ruby: Ouais, des finances.
    chef: Tu veux du travail ?
    ~ show ("chefhappy")
    chef: T’as qu'à m'aider en cuisine dans ce cas !
    ~ show ("chefidle")
    chef: On a toujours besoin de personne en plus .
    ruby: Chiant...
    ruby: Je cuisine pas moi, les seuls truc que je cook c’est avec mon winrate.
    chef: Tu ne cuisines pas ??? 
    ~ show ("chefasking")
    chef: Mais comment tu fais pour te nourrir ?
    ruby: Pastabox !
    ~ show ("chefidle")
    chef: Des nouilles instantanées ?... 
    ~ show ("chefangry")
    chef: DES NOUILLES INSTANTANÉ !
    chef: TU ME PRENDS POUR UN JAMBON ?!
    ruby: Mais tg, c'est très bon les pastabox !
    chef: AUCUN GOÛT !
    chef: TU NE COMPRENDS DONC PAS CE QU'EST LA CUISINE !
    chef: HORS DE MA VUE, SINON CA VA MAL FINIR POUR TOI !!!
    ruby: C’est toi qui n'a pas de goût!
    ~RubyDehors = true 
    ~ NBaction -= 1
    -> Restaurant
        
    ++ {Argent <= 9} [Mathéo]
    matheo: Salut Chef !
    ~ show ("chefhappy")
    chef: Mathéo !
    ~ show ("chefidle")
    chef: Tu veux aider en salle ?
    matheo: Aller .
    ~ show ("chefhappy")
    chef: Génial !
    chef: Mets-toi en tenue, hop hop hop !
    // IL A TRAVAILLÉ
    ~ show ("chefidle")
    chef: Merci ! Voilà ta paye !
    ~Argent += 1
    ~ NBaction -= 1
    -> Restaurant
    
+ [Sortir du retaurant]
~ NBaction -= 1
-> ActionPrincipale

== GroinMerlin ==
~ fadeBg("groinmerlin", 0.5)
~ show ("pamidle")

+ { Bois == true && Brique == true && Paille == true } [Passer à la caisse]
    pamela: C'est ce que vous cherchiez ?
    pico: Oui !
    pamela: Donc ça nous fait un total de...
    ~ show ("pamhappy")
    pamela: 36,45 Oats.
    {Argent >= 3: 
    pamela: Merci pour votre achat, et ne revenez pas !
    pico: Ouais, c'est bon...
    ~ Materiaux = "SourceOG"
    ~ Bois = false
    ~ Brique = false
    ~ Paille = false
    - else:
    pico: Tu prends les payments en plusieurs fois ?
    pamela: Désolé ce n'est pas dans les habitudes de la boutique.
    ~ show ("pamangry")
    pamela: Alors veuillez reposer vos achats et disparaitre de ma vue !
    }
    pico: Pas besoin d'être aussi directe !
    ruby: De toute façon, il n'y avait pas de rayon électronique...
    ~ show ("pamidle")
    pamela: Mathéo !
    matheo: Quoi ?
    ~ show ("pamlove")
    pamela: Toi, tu seras toujours le bienvenue...
    ~ NBaction -= 1
    -> GroinMerlin

+ [Parler avec la vendeuse] Avec ?
    ** [Pico]
        ~ show ("pamidle")
        pamela: Je peux vous aider ?
        pico: Ces perceuses font du bruit...
        pico: Elles me parlent.
        ~ show ("pamsad")
        pamela: ... (Je n’ai pas signé pour ça !)
        ~ NBaction -= 1
        -> GroinMerlin

    ** [Ruby]
        ~ show ("pamidle")
        pamela: Bonjour, je peux vous aider ?
        ruby: Vous avez des RTX 4090 ?
        ~ show ("pamasking")
        pamela: C’est LeGroinMerlin ici, pas Cyberland.
        ruby: Pff, scandale !
        ruby: Vendez des clous et taisez-vous.
        ~ show ("pamangry")
        pamela: Vous pouvez aussi sortir.
        ~ NBaction -= 1
        -> GroinMerlin

    ** [Mathéo]
        ~ show ("pamidle")
        pamela: Je peux t'aider ?
        matheo: Si t’étais une brique, je te poserais au sommet de ma maison.
        ~ show ("pamasking")
        pamela: Euh... 
        pamela: c’est gênant ou mignon ?
        matheo: Les deux.
        ~ show ("pamlove")
        ~ NBaction -= 1
        -> GroinMerlin

+ [Aller dans les rayons] Avec ?
    
    ** [Pico]
        pico: J’ai trouvé un truc qui mousse !
        ruby: !?!
        pico: Ca sort tout seule...
        matheo: Ça bulle, ça mousse...
        pico: On dirait une peinte magique !
        matheo: Soirée mousse !
        ~ show ("pamangry")
        pamela: Arrêtez de déteriorer tout ce que vous touchez !
        ~ NBaction -= 1
        -> GroinMerlin

    ** [Ruby]
        ruby: Ce lave-linge pourrait faire tourner Pigcraft...
        ruby: (Voyons voir...)
        ruby: ... 
        ruby: Zut !
        // La machine s’envole
        matheo: T’as pété le plafond, meuf.
        ruby: La vendeuse va me saucisser c’est sûr !
        ~ NBaction -= 1
        matheo: Bouffonne .
        -> GroinMerlin

    ** [Mathéo]
        matheo: Une mouche... (elle me défie !)
        matheo: (Ce marteau devrait suffir...)
        matheo: Justice !
        // Démolie les rayons
        ~ show ("pamangry")
        pamela: T'AS DÉMOLI LE RAYON !
        ~ show ("pamlove")
        pamela: … (Mais quelle puissance.)
        ~ NBaction -= 1
        -> GroinMerlin


+ { SacCiment == true} [Fabriquer du ciment] Avec ?
    ** [Pico]
        { Eau == true:
            pico: Eau... 
            pico: Ciment... 
            pico: On fait remuer le tout...
            pico: Et voilà !
            pico: C'est pas si compliqué.
            {CimentMain == true}pico: Hein Mathéo ?
            ~ Materiaux = "Ciment"
            ~ SacCiment = false
        -else:
            pico: J’ai le ciment, mais c'est tout...
            pico: Faut un fluide... (C'est quoi le truc que je dilue avec mon pastis déja ?)
        }
        ~ NBaction -= 1
        -> GroinMerlin

    ** [Ruby]
        { Eau == true:
            ruby: Bon, let's go.
            ruby: Plus qu'a crafter.
            ruby: ... 
            ruby: Ça colle pas bien ...
            ruby: J'ai raté le ciment !
            ~ Materiaux = "Ciment"
            ~ SacCiment = false
        -else:
            ruby: Ok, j’ai le ciment... 
            ruby: Mais il manque l'eau là...
        }
        ~ NBaction -= 1
        -> GroinMerlin

    ** [Mathéo]
        { Eau == true:
            matheo: C’est comme un gâteau, non ?
            matheo: Tu mélanges et hop.
            matheo: AAAAAAH !
            matheo: Mes mains sont prises dedans !
            ruby: Bouffon !
            ~ CimentMain = true
        -else:
            matheo: Faut pas juste verser de la poudre comme ça ?
        }
        ~ NBaction -= 1
        -> GroinMerlin


+ { LivreComptes == true} [Chercher les matériaux OG] Avec ?
    ** [Pico]
        pico: Voyons ce livre...
        pico: Oooooh !
        pico: J'ai trouvé le bois !
        ~ Bois = true
        { Bois == true && Brique == true && Paille == true:
        ~ LivreComptes = false
        pico: C'est bon, je crois qu'on a tout.
        }
        ~ NBaction -= 1
        -> GroinMerlin

    ** [Ruby]
        ruby: ...
        ruby: De la brique donc...
        ruby: C’est décidément très rustique, mais si ça marche...
        ruby: Mathéo !
        ruby: J'ai besoin de tes muscles !
        matheo: Ok, pas plus ?
        ruby: Non ça devrait aller .
        ruby: (Je crois pas que le reste soit très qualitatif...)
        ~ Brique = true
        { Bois == true && Brique == true && Paille == true:
        ~ LivreComptes = false
        ruby: On a toute les ressources du livre,
        ruby: On paye et on se tire !
        }
        ~ NBaction -= 1
        -> GroinMerlin

    ** [Mathéo]
        matheo: Donc...
        matheo: Oui c'est ça...
        matheo: Sûrement...
        matheo: Ce truc dans le livre...
        matheo: j’en comprends que dalle !
        matheo: De la paille ?
        matheo: ...
        matheo: Bahh, ça devrait le faire.
        ~ Paille = true
        { Bois == true && Brique == true && Paille == true:
        ~ LivreComptes = false
        matheo: C'est bon, j'ai le matos !
        pico: Perdons pas plus de temps !
        }
        ~ NBaction -= 1
        -> GroinMerlin
        
    
        pico: Y a plus rien de la liste...
        matheo: Donc ?
        pico: Ouep !
        ruby: Alors on attend quoi ?
        ruby: Le déluge !
        ~ NBaction -= 1
        -> GroinMerlin

+ [Sortir du Le Groin Merlin]
~ NBaction -= 1
-> ActionPrincipale

=== function ActivatePuzzle(active)
EXTERNAL ActivatePuzzle(active)

=== function ActivateTimer(active)
EXTERNAL ActivateTimer(active)

