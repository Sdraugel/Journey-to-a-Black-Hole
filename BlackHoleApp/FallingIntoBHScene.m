//
//  FallingIntoBHScene.m
//  FallingIntoBH
//
//  Created by mac on 6/16/14.
//  Copyright (c) 2014 Steven Draugel. All rights reserved.
//

#import "FallingIntoBHScene.h"

@implementation FallingIntoBHScene

//////////////////////////////////////////////////////////////////////////////////////////////////

SKAction *movement1, *mag1, *movement2, *movement3, *movement4, *movement5, *movement6, *movement7, *movement8, *movement9, *movement10, *movement11, *movement12, *movement13, *movement14, *movement15, *movement16,  *movement17,  *movement18,  *movement19,  *movement20,  *movement21, *movement22,  *movement23,  *movement24,  *movement25,  *movement26, *movement27,  *movement28,  *movement29,  *movement30,  *movement31,  *movement32,  *movement33,  *movement34,  *movement35,  *movement36,  *movement37,  *movement38,  *movement39,  *movement40,  *movement41,  *movement42,  *movement43,  *movement44,  *movement45, *movement46,  *movement47,  *stop,  *removeNode, *movement1a, *mag1a, *movement2a, *movement3a, *movement4a, *movement5a, *movement6a, *movement7a, *movement8a, *movement9a, *movement10a, *movement11a, *movement12a, *movement13a, *movement14a, *movement15a, *movement16a,  *movement17a,  *movement18a,  *movement19a,  *movement20a,  *movement21a, *movement22a,  *movement23a,  *movement24a,  *movement25a,  *movement26a, *movement27a,  *movement28a,  *movement29a,  *movement30a,  *movement31a,  *movement32a,  *movement33a,  *movement34a,  *movement35a,  *movement36a,  *movement37a,  *movement38a,  *movement39a,  *movement40a,  *movement41a,  *movement42a,  *movement43a,  *movement44a,  *movement45a, *movement46a,  *movement47a;

//////////////////////////////////////////////////////////////////////////////////////////////////

SKShapeNode *shapeNodeBH, *shapeNode1, *shapeNode2, *shapeNode3, *shapeNode4, *shapeNode5, *shapeNode6, *shapeNode7, *shapeNode8, *shapeNode9, *shapeNode10, *shapeNode11, *shapeNode12, *shapeNode13, *shapeNode14, *shapeNode15, *shapeNode16, *shapeNode17, *shapeNode18, *shapeNode19, *shapeNode20, *shapeNode21, *shapeNode22, *shapeNode23, *shapeNode24, *shapeNode25, *shapeNode26, *shapeNode27, *shapeNode28, *shapeNode29, *shapeNode30, *shapeNode31, *shapeNode32, *shapeNode33, *shapeNode34, *shapeNode35, *shapeNode36, *shapeNode37, *shapeNode38, *shapeNode39, *shapeNode40, *shapeNode41, *shapeNode42, *shapeNode43, *shapeNode44, *shapeNode45, *shapeNode46, *shapeNode47, *blackHole, *shapeNode1a, *shapeNode2a, *shapeNode3a, *shapeNode4a, *shapeNode5a, *shapeNode6a, *shapeNode7a, *shapeNode8a, *shapeNode9a, *shapeNode10a, *shapeNode11a, *shapeNode12a, *shapeNode13a, *shapeNode14a, *shapeNode15a, *shapeNode16a, *shapeNode17a, *shapeNode18a, *shapeNode19a, *shapeNode20a, *shapeNode21a, *shapeNode22a, *shapeNode23a, *shapeNode24a, *shapeNode25a, *shapeNode26a, *shapeNode27a, *shapeNode28a, *shapeNode29a, *shapeNode30a, *shapeNode31a, *shapeNode32a, *shapeNode33a, *shapeNode34a, *shapeNode35a, *shapeNode36a, *shapeNode37a, *shapeNode38a, *shapeNode39a, *shapeNode40a, *shapeNode41a, *shapeNode42a, *shapeNode43a, *shapeNode44a, *shapeNode45a, *shapeNode46a, *shapeNode47a;

SKLabelNode *distanceLabel;

CGPoint pos1;

//////////////////////////////////////////////////////////////////////////////////////////////////

//Blackhole location variables
CGPoint location;
CGFloat BHPosX, BHPosY;
UITouch *touch;

//////////////////////////////////////////////////////////////////////////////////////////////////

//Initial variable declerations
bool forward = NO;
bool reverse = NO;
bool pauseMovement = NO;
bool reset = NO;
float cf;
int numTouch = 0;
float DBH;
float nSteps;
float dLogZ;
float maxSteps;
float minSteps;
bool morph = TRUE;
NSString *label = @"Distance from the Blackhole: ", *distanceString;

int startCounter;
int count = 0;
float ambSize = .5;

float wavlO1, wavlO2, wavlO5, wavlO9, wavlO11, wavlO13, wavlO28;
float wavlS1, wavlS2, wavlS5, wavlS9, wavlS11, wavlS13, wavlS28;

//////////////////////////////////////////////////////////////////////////////////////////////////
/* Rediculous variable bank.....
 * objects or variables with an a at the end of their name are designated as "Ambient" i.e. randomized
 */
//Distance factor from the black hole, x and y
float dfx1i, dfy1i, dfx2i, dfy2i, dfx3i, dfy3i, dfx4i, dfy4i, dfx5i, dfy5i, dfx6i, dfy6i, dfx7i, dfy7i, dfx8i, dfy8i, dfx9i, dfy9i, dfx10i, dfy10i, dfx11i, dfy11i, dfx12i, dfy12i, dfx13i, dfy13i, dfx14i, dfy14i, dfx15i, dfy15i, dfx16i, dfy16i, dfx17i, dfy17i, dfx18i, dfy18i, dfx19i, dfy19i, dfx20i, dfy20i, dfx21i, dfy21i, dfx22i, dfy22i, dfx23i, dfy23i, dfx24i, dfy24i, dfx25i, dfy25i, dfx26i, dfy26i, dfx27i, dfy27i, dfx28i, dfy28i, dfx29i, dfy29i, dfx30i, dfy30i, dfx31i, dfy31i, dfx32i, dfy32i, dfx33i, dfy33i, dfx34i, dfy34i, dfx35i, dfy35i, dfx36i, dfy36i, dfx37i, dfy37i, dfx38i, dfy38i, dfx39i, dfy39i, dfx40i, dfy40i, dfx41i, dfy41i, dfx42i, dfy42i, dfx43i, dfy43i, dfx44i, dfy44i, dfx45i, dfy45i, dfx46i, dfy46i, dfx47i, dfy47i, dfx1ia, dfy1ia, dfx2ia, dfy2ia, dfx3ia, dfy3ia, dfx4ia, dfy4ia, dfx5ia, dfy5ia, dfx6ia, dfy6ia, dfx7ia, dfy7ia, dfx8ia, dfy8ia, dfx9ia, dfy9ia, dfx10ia, dfy10ia, dfx11ia, dfy11ia, dfx12ia, dfy12ia, dfx13ia, dfy13ia, dfx14ia, dfy14ia, dfx15ia, dfy15ia, dfx16ia, dfy16ia, dfx17ia, dfy17ia, dfx18ia, dfy18ia, dfx19ia, dfy19ia, dfx20ia, dfy20ia, dfx21ia, dfy21ia, dfx22ia, dfy22ia, dfx23ia, dfy23ia, dfx24ia, dfy24ia, dfx25ia, dfy25ia, dfx26ia, dfy26ia, dfx27ia, dfy27ia, dfx28ia, dfy28ia, dfx29ia, dfy29ia, dfx30ia, dfy30ia, dfx31ia, dfy31ia, dfx32ia, dfy32ia, dfx33ia, dfy33ia, dfx34ia, dfy34ia, dfx35ia, dfy35ia, dfx36ia, dfy36ia, dfx37ia, dfy37ia, dfx38ia, dfy38ia, dfx39ia, dfy39ia, dfx40ia, dfy40ia, dfx41ia, dfy41ia, dfx42ia, dfy42ia, dfx43ia, dfy43ia, dfx44ia, dfy44ia, dfx45ia, dfy45ia, dfx46ia, dfy46ia, dfx47ia, dfy47ia;

float dfx1Total, dfx2Total, dfx3Total, dfx4Total, dfx5Total, dfx6Total, dfx7Total, dfx8Total, dfx9Total, dfx10Total, dfx11Total, dfx12Total, dfx13Total, dfx14Total, dfx15Total, dfx16Total, dfx17Total, dfx18Total, dfx19Total, dfx20Total, dfx21Total, dfx22Total, dfx23Total, dfx24Total, dfx25Total, dfx26Total, dfx27Total, dfx28Total, dfx29Total, dfx30Total, dfx31Total, dfx32Total, dfx33Total, dfx34Total, dfx35Total, dfx36Total, dfx37Total, dfx38Total, dfx39Total, dfx40Total, dfx41Total, dfx42Total, dfx43Total, dfx44Total, dfx45Total, dfx46Total, dfx47Total, dfx1Totala, dfx2Totala, dfx3Totala, dfx4Totala, dfx5Totala, dfx6Totala, dfx7Totala, dfx8Totala, dfx9Totala, dfx10Totala, dfx11Totala, dfx12Totala, dfx13Totala, dfx14Totala, dfx15Totala, dfx16Totala, dfx17Totala, dfx18Totala, dfx19Totala, dfx20Totala, dfx21Totala, dfx22Totala, dfx23Totala, dfx24Totala, dfx25Totala, dfx26Totala, dfx27Totala, dfx28Totala, dfx29Totala, dfx30Totala, dfx31Totala, dfx32Totala, dfx33Totala, dfx34Totala, dfx35Totala, dfx36Totala, dfx37Totala, dfx38Totala, dfx39Totala, dfx40Totala, dfx41Totala, dfx42Totala, dfx43Totala, dfx44Totala, dfx45Totala, dfx46Totala, dfx47Totala;

float dfy1Total, dfy2Total, dfy3Total, dfy4Total, dfy5Total, dfy6Total, dfy7Total, dfy8Total, dfy9Total, dfy10Total, dfy11Total, dfy12Total, dfy13Total, dfy14Total, dfy15Total, dfy16Total, dfy17Total, dfy18Total, dfy19Total, dfy20Total, dfy21Total, dfy21Total, dfy22Total, dfy23Total, dfy24Total, dfy25Total, dfy26Total, dfy27Total, dfy28Total, dfy29Total, dfy30Total, dfy31Total, dfy32Total, dfy33Total, dfy34Total, dfy35Total, dfy36Total, dfy37Total, dfy38Total, dfy39Total, dfy40Total, dfy41Total, dfy42Total, dfy43Total, dfy44Total, dfy45Total, dfy46Total, dfy47Total, dfy1Totala, dfy2Totala, dfy3Totala, dfy4Totala, dfy5Totala, dfy6Totala, dfy7Totala, dfy8Totala, dfy9Totala, dfy10Totala, dfy11Totala, dfy12Totala, dfy13Totala, dfy14Totala, dfy15Totala, dfy16Totala, dfy17Totala, dfy18Totala, dfy19Totala, dfy20Totala, dfy21Totala, dfy21Totala, dfy22Totala, dfy23Totala, dfy24Totala, dfy25Totala, dfy26Totala, dfy27Totala, dfy28Totala, dfy29Totala, dfy30Totala, dfy31Totala, dfy32Totala, dfy33Totala, dfy34Totala, dfy35Totala, dfy36Totala, dfy37Totala, dfy38Totala, dfy39Totala, dfy40Totala, dfy41Totala, dfy42Totala, dfy43Totala, dfy44Totala, dfy45Totala, dfy46Totala, dfy47Totala;

float delta1i, delta2i, delta3i, delta4i, delta5i, delta6i, delta7i, delta8i, delta9i, delta10i, delta11i, delta12i, delta13i, delta14i, delta15i, delta16i, delta17i, delta18i, delta19i, delta20i, delta21i, delta22i, delta23i, delta24i, delta25i, delta26i, delta27i, delta28i, delta29i, delta30i, delta31i, delta32i, delta33i, delta34i, delta35i, delta36i, delta37i, delta38i, delta39i, delta40i, delta41i, delta42i, delta43i, delta44i, delta45i, delta46i, delta47i, delta1ia, delta2ia, delta3ia, delta4ia, delta5ia, delta6ia, delta7ia, delta8ia, delta9ia, delta10ia, delta11ia, delta12ia, delta13ia, delta14ia, delta15ia, delta16ia, delta17ia, delta18ia, delta19ia, delta20ia, delta21ia, delta22ia, delta23ia, delta24ia, delta25ia, delta26ia, delta27ia, delta28ia, delta29ia, delta30ia, delta31ia, delta32ia, delta33ia, delta34ia, delta35ia, delta36ia, delta37ia, delta38ia, delta39ia, delta40ia, delta41ia, delta42ia, delta43ia, delta44ia, delta45ia, delta46ia, delta47ia;

float delta1New, delta2New, delta3New, delta4New, delta5New, delta6New, delta7New, delta8New, delta9New, delta10New, delta11New, delta12New, delta13New, delta14New, delta15New, delta16New, delta17New, delta18New, delta19New, delta20New, delta21New, delta22New, delta23New, delta24New, delta25New, delta26New, delta27New, delta28New, delta29New, delta30New, delta31New, delta32New, delta33New, delta34New, delta35New, delta36New, delta37New, delta38New, delta39New, delta40New, delta41New, delta42New, delta43New, delta44New, delta45New, delta46New, delta47New, delta1Newa, delta2Newa, delta3Newa, delta4Newa, delta5Newa, delta6Newa, delta7Newa, delta8Newa, delta9Newa, delta10Newa, delta11Newa, delta12Newa, delta13Newa, delta14Newa, delta15Newa, delta16Newa, delta17Newa, delta18Newa, delta19Newa, delta20Newa, delta21Newa, delta22Newa, delta23Newa, delta24Newa, delta25Newa, delta26Newa, delta27Newa, delta28Newa, delta29Newa, delta30Newa, delta31Newa, delta32Newa, delta33Newa, delta34Newa, delta35Newa, delta36Newa, delta37Newa, delta38Newa, delta39Newa, delta40Newa, delta41Newa, delta42Newa, delta43Newa, delta44Newa, delta45Newa, delta46Newa, delta47Newa;

float thetaE;

float deltaMag1, deltaMag2, deltaMag3, deltaMag4, deltaMag5, deltaMag6, deltaMag7, deltaMag8, deltaMag9, deltaMag10, deltaMag11, deltaMag12, deltaMag13, deltaMag14, deltaMag15, deltaMag16, deltaMag17, deltaMag18, deltaMag19, deltaMag20, deltaMag21, deltaMag22, deltaMag23, deltaMag24, deltaMag25, deltaMag26, deltaMag27, deltaMag28, deltaMag29, deltaMag30, deltaMag31, deltaMag32, deltaMag33, deltaMag34, deltaMag35, deltaMag36, deltaMag37, deltaMag38, deltaMag39, deltaMag40, deltaMag41, deltaMag42, deltaMag43, deltaMag44, deltaMag45, deltaMag46, deltaMag47, deltaMag1a, deltaMag2a, deltaMag3a, deltaMag4a, deltaMag5a, deltaMag6a, deltaMag7a, deltaMag8a, deltaMag9a, deltaMag10a, deltaMag11a, deltaMag12a, deltaMag13a, deltaMag14a, deltaMag15a, deltaMag16a, deltaMag17a, deltaMag18a, deltaMag19a, deltaMag20a, deltaMag21a, deltaMag22a, deltaMag23a, deltaMag24a, deltaMag25a, deltaMag26a, deltaMag27a, deltaMag28a, deltaMag29a, deltaMag30a, deltaMag31a, deltaMag32a, deltaMag33a, deltaMag34a, deltaMag35a, deltaMag36a, deltaMag37a, deltaMag38a, deltaMag39a, deltaMag40a, deltaMag41a, deltaMag42a, deltaMag43a, deltaMag44a, deltaMag45a, deltaMag46a, deltaMag47a;

float moveNode1x, moveNode2x, moveNode3x, moveNode4x, moveNode5x, moveNode6x, moveNode7x, moveNode8x, moveNode9x, moveNode10x, moveNode11x, moveNode12x, moveNode13x, moveNode14x, moveNode15x, moveNode16x, moveNode17x, moveNode18x, moveNode19x, moveNode20x, moveNode21x, moveNode22x, moveNode23x, moveNode24x, moveNode25x, moveNode26x, moveNode27x, moveNode28x, moveNode29x, moveNode30x, moveNode31x, moveNode32x, moveNode33x, moveNode34x, moveNode35x, moveNode36x, moveNode37x, moveNode38x, moveNode39x, moveNode40x, moveNode41x, moveNode42x, moveNode43x, moveNode44x, moveNode45x, moveNode46x, moveNode47x, moveNode1xa, moveNode2xa, moveNode3xa, moveNode4xa, moveNode5xa, moveNode6xa, moveNode7xa, moveNode8xa, moveNode9xa, moveNode10xa, moveNode11xa, moveNode12xa, moveNode13xa, moveNode14xa, moveNode15xa, moveNode16xa, moveNode17xa, moveNode18xa, moveNode19xa, moveNode20xa, moveNode21xa, moveNode22xa, moveNode23xa, moveNode24xa, moveNode25xa, moveNode26xa, moveNode27xa, moveNode28xa, moveNode29xa, moveNode30xa, moveNode31xa, moveNode32xa, moveNode33xa, moveNode34xa, moveNode35xa, moveNode36xa, moveNode37xa, moveNode38xa, moveNode39xa, moveNode40xa, moveNode41xa, moveNode42xa, moveNode43xa, moveNode44xa, moveNode45xa, moveNode46xa, moveNode47xa;

float moveNode1y, moveNode2y, moveNode3y, moveNode4y, moveNode5y, moveNode6y, moveNode7y, moveNode8y, moveNode9y, moveNode10y, moveNode11y, moveNode12y, moveNode13y, moveNode14y, moveNode15y, moveNode16y, moveNode17y, moveNode18y, moveNode19y, moveNode20y, moveNode21y, moveNode22y, moveNode23y, moveNode24y, moveNode25y, moveNode26y, moveNode27y, moveNode28y, moveNode29y, moveNode30y, moveNode31y, moveNode32y, moveNode33y, moveNode34y, moveNode35y, moveNode36y, moveNode37y, moveNode38y, moveNode39y, moveNode40y, moveNode41y, moveNode42y, moveNode43y, moveNode44y, moveNode45y, moveNode46y, moveNode47y, moveNode1ya, moveNode2ya, moveNode3ya, moveNode4ya, moveNode5ya, moveNode6ya, moveNode7ya, moveNode8ya, moveNode9ya, moveNode10ya, moveNode11ya, moveNode12ya, moveNode13ya, moveNode14ya, moveNode15ya, moveNode16ya, moveNode17ya, moveNode18ya, moveNode19ya, moveNode20ya, moveNode21ya, moveNode22ya, moveNode23ya, moveNode24ya, moveNode25ya, moveNode26ya, moveNode27ya, moveNode28ya, moveNode29ya, moveNode30ya, moveNode31ya, moveNode32ya, moveNode33ya, moveNode34ya, moveNode35ya, moveNode36ya, moveNode37ya, moveNode38ya, moveNode39ya, moveNode40ya, moveNode41ya, moveNode42ya, moveNode43ya, moveNode44ya, moveNode45ya, moveNode46ya, moveNode47ya;

float xOrigin1, yOrigin1, xOrigin2, yOrigin2, xOrigin3, yOrigin3, xOrigin4, yOrigin4, xOrigin5, yOrigin5, xOrigin6, yOrigin6, xOrigin7, yOrigin7, xOrigin8, yOrigin8, xOrigin9, yOrigin9, xOrigin10, yOrigin10, xOrigin11, yOrigin11, xOrigin12, yOrigin12, xOrigin13, yOrigin13, xOrigin14, yOrigin14, xOrigin15, yOrigin15, xOrigin16, yOrigin16, xOrigin17, yOrigin17, xOrigin18, yOrigin18, xOrigin19, yOrigin19, xOrigin20, yOrigin20, xOrigin21, yOrigin21, xOrigin22, yOrigin22, xOrigin23, yOrigin23, xOrigin24, yOrigin24, xOrigin25, yOrigin25, xOrigin26, yOrigin26, xOrigin27, yOrigin27, xOrigin28, yOrigin28, xOrigin29, yOrigin29, xOrigin30, yOrigin30, yOrigin31, xOrigin31, yOrigin32, xOrigin32, xOrigin33, yOrigin33, xOrigin34, yOrigin34, xOrigin35, yOrigin35, xOrigin36, yOrigin36, xOrigin37, yOrigin37, xOrigin38, yOrigin38, xOrigin39, yOrigin39, xOrigin40, yOrigin40, xOrigin41, yOrigin41, xOrigin42, yOrigin42, xOrigin43, yOrigin43, xOrigin44, yOrigin44, xOrigin45, yOrigin45, xOrigin46, yOrigin46, xOrigin47, yOrigin47, xOrigin1a, yOrigin1a, xOrigin2a, yOrigin2a, xOrigin3a, yOrigin3a, xOrigin4a, yOrigin4a, xOrigin5a, yOrigin5a, xOrigin6a, yOrigin6a, xOrigin7a, yOrigin7a, xOrigin8a, yOrigin8a, xOrigin9a, yOrigin9a, xOrigin10a, yOrigin10a, xOrigin11a, yOrigin11a, xOrigin12a, yOrigin12a, xOrigin13a, yOrigin13a, xOrigin14a, yOrigin14a, xOrigin15a, yOrigin15a, xOrigin16a, yOrigin16a, xOrigin17a, yOrigin17a, xOrigin18a, yOrigin18a, xOrigin19a, yOrigin19a, xOrigin20a, yOrigin20a, xOrigin21a, yOrigin21a, xOrigin22a, yOrigin22a, xOrigin23a, yOrigin23a, xOrigin24a, yOrigin24a, xOrigin25a, yOrigin25a, xOrigin26a, yOrigin26a, xOrigin27a, yOrigin27a, xOrigin28a, yOrigin28a, xOrigin29a, yOrigin29a, xOrigin30a, yOrigin30a, yOrigin31a, xOrigin31a, yOrigin32a, xOrigin32a, xOrigin33a, yOrigin33a, xOrigin34a, yOrigin34a, xOrigin35a, yOrigin35a, xOrigin36a, yOrigin36a, xOrigin37a, yOrigin37a, xOrigin38a, yOrigin38a, xOrigin39a, yOrigin39a, xOrigin40a, yOrigin40a, xOrigin41a, yOrigin41a, xOrigin42a, yOrigin42a, xOrigin43a, yOrigin43a, xOrigin44a, yOrigin44a, xOrigin45a, yOrigin45a, xOrigin46a, yOrigin46a, xOrigin47a, yOrigin47a;

float rho4;

float dfx1new, dfx2new, dfx3new, dfx4new, dfx5new, dfx6new, dfx7new, dfx8new, dfx9new, dfx10new, dfx11new, dfx12new, dfx13new, dfx14new, dfx15new, dfx16new, dfx17new, dfx18new, dfx19new, dfx20new, dfx21new, dfx22new, dfx23new, dfx24new, dfx25new, dfx26new, dfx27new, dfx28new, dfx29new, dfx30new, dfx31new, dfx32new, dfx33new, dfx34new, dfx35new, dfx36new, dfx37new, dfx38new, dfx39new, dfx40new, dfx41new, dfx42new, dfx43new, dfx44new, dfx45new, dfx46new, dfx47new, dfx1newa, dfx2newa, dfx3newa, dfx4newa, dfx5newa, dfx6newa, dfx7newa, dfx8newa, dfx9newa, dfx10newa, dfx11newa, dfx12newa, dfx13newa, dfx14newa, dfx15newa, dfx16newa, dfx17newa, dfx18newa, dfx19newa, dfx20newa, dfx21newa, dfx22newa, dfx23newa, dfx24newa, dfx25newa, dfx26newa, dfx27newa, dfx28newa, dfx29newa, dfx30newa, dfx31newa, dfx32newa, dfx33newa, dfx34newa, dfx35newa, dfx36newa, dfx37newa, dfx38newa, dfx39newa, dfx40newa, dfx41newa, dfx42newa, dfx43newa, dfx44newa, dfx45newa, dfx46newa, dfx47newa;

float dfy1new, dfy2new, dfy3new, dfy4new, dfy5new, dfy6new, dfy7new, dfy8new, dfy9new, dfy10new, dfy11new, dfy12new, dfy13new, dfy14new, dfy15new, dfy16new, dfy17new, dfy18new, dfy19new, dfy20new, dfy21new, dfy22new, dfy23new, dfy24new, dfy25new, dfy26new, dfy27new, dfy28new, dfy29new, dfy30new, dfy31new, dfy32new, dfy33new, dfy34new, dfy35new, dfy36new, dfy37new, dfy38new, dfy39new, dfy40new, dfy41new, dfy42new, dfy43new, dfy44new, dfy45new, dfy46new, dfy47new, dfy1newa, dfy2newa, dfy3newa, dfy4newa, dfy5newa, dfy6newa, dfy7newa, dfy8newa, dfy9newa, dfy10newa, dfy11newa, dfy12newa, dfy13newa, dfy14newa, dfy15newa, dfy16newa, dfy17newa, dfy18newa, dfy19newa, dfy20newa, dfy21newa, dfy22newa, dfy23newa, dfy24newa, dfy25newa, dfy26newa, dfy27newa, dfy28newa, dfy29newa, dfy30newa, dfy31newa, dfy32newa, dfy33newa, dfy34newa, dfy35newa, dfy36newa, dfy37newa, dfy38newa, dfy39newa, dfy40newa, dfy41newa, dfy42newa, dfy43newa, dfy44newa, dfy45newa, dfy46newa, dfy47newa;

float redVar, greenVar, blueVar, red, green, blue;

float deltaTheta1i, deltaTheta2i, deltaTheta3i, deltaTheta4i, deltaTheta5i, deltaTheta6i, deltaTheta7i, deltaTheta8i, deltaTheta9i, deltaTheta10i, deltaTheta11i, deltaTheta12i, deltaTheta13i, deltaTheta14i, deltaTheta15i, deltaTheta16i, deltaTheta17i, deltaTheta18i, deltaTheta19i, deltaTheta20i, deltaTheta21i, deltaTheta22i, deltaTheta23i, deltaTheta24i, deltaTheta25i, deltaTheta26i, deltaTheta27i, deltaTheta28i, deltaTheta29i, deltaTheta30i, deltaTheta31i, deltaTheta32i, deltaTheta33i, deltaTheta34i, deltaTheta35i, deltaTheta36i, deltaTheta37i, deltaTheta38i, deltaTheta39i, deltaTheta40i, deltaTheta41i, deltaTheta42i, deltaTheta43i, deltaTheta44i, deltaTheta45i, deltaTheta46i, deltaTheta47i, deltaTheta1ia, deltaTheta2ia, deltaTheta3ia, deltaTheta4ia, deltaTheta5ia, deltaTheta6ia, deltaTheta7ia, deltaTheta8ia, deltaTheta9ia, deltaTheta10ia, deltaTheta11ia, deltaTheta12ia, deltaTheta13ia, deltaTheta14ia, deltaTheta15ia, deltaTheta16ia, deltaTheta17ia, deltaTheta18ia, deltaTheta19ia, deltaTheta20ia, deltaTheta21ia, deltaTheta22ia, deltaTheta23ia, deltaTheta24ia, deltaTheta25ia, deltaTheta26ia, deltaTheta27ia, deltaTheta28ia, deltaTheta29ia, deltaTheta30ia, deltaTheta31ia, deltaTheta32ia, deltaTheta33ia, deltaTheta34ia, deltaTheta35ia, deltaTheta36ia, deltaTheta37ia, deltaTheta38ia, deltaTheta39ia, deltaTheta40ia, deltaTheta41ia, deltaTheta42ia, deltaTheta43ia, deltaTheta44ia, deltaTheta45ia, deltaTheta46ia, deltaTheta47ia;

float deltaTheta1New, deltaTheta2New, deltaTheta3New, deltaTheta4New, deltaTheta5New, deltaTheta6New, deltaTheta7New, deltaTheta8New, deltaTheta9New, deltaTheta10New, deltaTheta11New, deltaTheta12New, deltaTheta13New, deltaTheta14New, deltaTheta15New, deltaTheta16New, deltaTheta17New, deltaTheta18New, deltaTheta19New, deltaTheta20New, deltaTheta21New, deltaTheta22New, deltaTheta23New, deltaTheta24New, deltaTheta25New, deltaTheta26New, deltaTheta27New, deltaTheta28New, deltaTheta29New, deltaTheta30New, deltaTheta31New, deltaTheta32New, deltaTheta33New, deltaTheta34New, deltaTheta35New, deltaTheta36New, deltaTheta37New, deltaTheta38New, deltaTheta39New, deltaTheta40New, deltaTheta41New, deltaTheta42New, deltaTheta43New, deltaTheta44New, deltaTheta45New, deltaTheta46New, deltaTheta47New, deltaTheta1Newa, deltaTheta2Newa, deltaTheta3Newa, deltaTheta4Newa, deltaTheta5Newa, deltaTheta6Newa, deltaTheta7Newa, deltaTheta8Newa, deltaTheta9Newa, deltaTheta10Newa, deltaTheta11Newa, deltaTheta12Newa, deltaTheta13Newa, deltaTheta14Newa, deltaTheta15Newa, deltaTheta16Newa, deltaTheta17Newa, deltaTheta18Newa, deltaTheta19Newa, deltaTheta20Newa, deltaTheta21Newa, deltaTheta22Newa, deltaTheta23Newa, deltaTheta24Newa, deltaTheta25Newa, deltaTheta26Newa, deltaTheta27Newa, deltaTheta28Newa, deltaTheta29Newa, deltaTheta30Newa, deltaTheta31Newa, deltaTheta32Newa, deltaTheta33Newa, deltaTheta34Newa, deltaTheta35Newa, deltaTheta36Newa, deltaTheta37Newa, deltaTheta38Newa, deltaTheta39Newa, deltaTheta40Newa, deltaTheta41Newa, deltaTheta42Newa, deltaTheta43Newa, deltaTheta44Newa, deltaTheta45Newa, deltaTheta46Newa, deltaTheta47Newa;

float maxDistance;
float minDistance;
float distance;

float startValue;

NSMutableArray *wavelengths;
NSArray *shapeNodes;

int k = 0;
//////////////////////////////////////////////////////////////////////////////////////////////////

UIColor *colorA;
UIColor *colorB;
UIColor *colorO;
UIColor *colorM;
UIColor *colorK;
UIColor *colorF;
UIColor *colorG;

CGFloat height;
CGFloat width;
CGPoint center;

int i = 0;

/*Main method that creates the initial star field
 *@Return id
 */
-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        reset = YES;
        [self resetNodes];
        reset = NO;
        startCounter = 0;
        //Background
        self.backgroundColor = [SKColor clearColor];
        height = self.frame.size.height / 2;
        width = self.frame.size.width / 2;
        center = CGPointMake(width, height);
        
        /* Initial values
         */
        //conversion factor (map to ipad)
        cf = 4.451;
        
        shapeNodes = [NSArray arrayWithObjects: shapeNode1, shapeNode2, shapeNode3, shapeNode4, shapeNode5, shapeNode6, shapeNode7, shapeNode8, shapeNode9, shapeNode10, shapeNode11, shapeNode12, shapeNode13, shapeNode14, shapeNode15, shapeNode16, shapeNode17, shapeNode18, shapeNode19, shapeNode20, shapeNode21, shapeNode22, shapeNode23, shapeNode24, shapeNode25, shapeNode26, shapeNode27, shapeNode28, shapeNode29, shapeNode30, shapeNode31, shapeNode32, shapeNode33, shapeNode34, shapeNode35, shapeNode36, shapeNode37, shapeNode38, shapeNode39, shapeNode40, shapeNode41, shapeNode42, shapeNode43, shapeNode44, shapeNode45, shapeNode46, shapeNode47, shapeNode1a, shapeNode2a, shapeNode3a, shapeNode4a, shapeNode5a, shapeNode6a, shapeNode7a, shapeNode8a, shapeNode9a, shapeNode10a, shapeNode11a, shapeNode12a, shapeNode13a, shapeNode14a, shapeNode15a, shapeNode16a, shapeNode17a, shapeNode18a, shapeNode19a, shapeNode20a, shapeNode21a, shapeNode22a, shapeNode23a, shapeNode24a, shapeNode25a, shapeNode26a, shapeNode27a, shapeNode28a, shapeNode29a, shapeNode30a, shapeNode31a, shapeNode32a, shapeNode33a, shapeNode34a, shapeNode35a, shapeNode36a, shapeNode37a, shapeNode38a, shapeNode39a, shapeNode40a, shapeNode41a, shapeNode42a, shapeNode43a, shapeNode44a, shapeNode45a, shapeNode46, shapeNode47a, nil];
        
        //***********************************************************************************************************
        nSteps = 500;
        startValue = nSteps;
        maxDistance = 10000;
        minDistance = 1.5;
        maxSteps = nSteps;
        minSteps = 0;
        dLogZ = (log10f(maxDistance) - log10f(minDistance)) / nSteps;
        DBH = pow(10, log10f(minDistance) + (nSteps * dLogZ));
        thetaE = sqrt(2 / DBH);
        //***********************************************************************************************************
        
        //initial wavelength of each class of star
        wavlS5 = 465;
        wavlS2 = 470;
        wavlS1 = 480;
        wavlS13 = 530;
        wavlS28 = 580;
        wavlS11 = 587;
        wavlS9 = 593; //Betelgeuse
        
        //Distance from the Blackhole label
        distanceLabel = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
        label = @"DISTANCE FROM THE BLACK HOLE: ";
        distanceString = [NSString stringWithFormat:@"%@ r/Rs: %g ", label, DBH];
        distanceLabel.text = distanceString;
        distanceLabel.fontSize = 12;
        distanceLabel.fontColor = [SKColor orangeColor];
        distanceLabel.position = CGPointMake(center.x, center.y * 1.35);
        [self addChild:distanceLabel];
        
        wavlO5 = wavlS5;
        wavlO2 = wavlS2;
        wavlO1 = wavlS1;
        wavlO13 = wavlS13;
        wavlO28 = wavlS28;
        wavlO11 = wavlS11;
        wavlO9 = wavlS9;
        
        [self colorNodeLoop];
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        //Initial point locations of each star
        
        shapeNode1 = [[SKShapeNode alloc] init];
        shapeNode2 = [[SKShapeNode alloc] init];
        shapeNode3 = [[SKShapeNode alloc] init];
        shapeNode4 = [[SKShapeNode alloc] init];
        shapeNode5 = [[SKShapeNode alloc] init];
        shapeNode6 = [[SKShapeNode alloc] init];
        shapeNode7 = [[SKShapeNode alloc] init];
        shapeNode8 = [[SKShapeNode alloc] init];
        shapeNode9 = [[SKShapeNode alloc] init];
        shapeNode10 = [[SKShapeNode alloc] init];
        shapeNode11 = [[SKShapeNode alloc] init];
        shapeNode12 = [[SKShapeNode alloc] init];
        shapeNode13 = [[SKShapeNode alloc] init];
        shapeNode14 = [[SKShapeNode alloc] init];
        shapeNode15 = [[SKShapeNode alloc] init];
        shapeNode16 = [[SKShapeNode alloc] init];
        shapeNode17 = [[SKShapeNode alloc] init];
        shapeNode18 = [[SKShapeNode alloc] init];
        shapeNode19 = [[SKShapeNode alloc] init];
        shapeNode20 = [[SKShapeNode alloc] init];
        shapeNode21 = [[SKShapeNode alloc] init];
        shapeNode22 = [[SKShapeNode alloc] init];
        shapeNode23 = [[SKShapeNode alloc] init];
        shapeNode24 = [[SKShapeNode alloc] init];
        shapeNode25 = [[SKShapeNode alloc] init];
        shapeNode26 = [[SKShapeNode alloc] init];
        shapeNode27 = [[SKShapeNode alloc] init];
        shapeNode28 = [[SKShapeNode alloc] init];
        shapeNode29 = [[SKShapeNode alloc] init];
        shapeNode30 = [[SKShapeNode alloc] init];
        shapeNode31 = [[SKShapeNode alloc] init];
        shapeNode32 = [[SKShapeNode alloc] init];
        shapeNode33 = [[SKShapeNode alloc] init];
        shapeNode34 = [[SKShapeNode alloc] init];
        shapeNode35 = [[SKShapeNode alloc] init];
        shapeNode36 = [[SKShapeNode alloc] init];
        shapeNode37 = [[SKShapeNode alloc] init];
        shapeNode38 = [[SKShapeNode alloc] init];
        shapeNode39 = [[SKShapeNode alloc] init];
        shapeNode40 = [[SKShapeNode alloc] init];
        shapeNode41 = [[SKShapeNode alloc] init];
        shapeNode42 = [[SKShapeNode alloc] init];
        shapeNode43 = [[SKShapeNode alloc] init];
        shapeNode44 = [[SKShapeNode alloc] init];
        shapeNode45 = [[SKShapeNode alloc] init];
        shapeNode46 = [[SKShapeNode alloc] init];
        shapeNode47 = [[SKShapeNode alloc] init];
        
        //Ambient stars
        shapeNode1a = [[SKShapeNode alloc] init];
        shapeNode2a = [[SKShapeNode alloc] init];
        shapeNode3a = [[SKShapeNode alloc] init];
        shapeNode4a = [[SKShapeNode alloc] init];
        shapeNode5a = [[SKShapeNode alloc] init];
        shapeNode6a = [[SKShapeNode alloc] init];
        shapeNode7a = [[SKShapeNode alloc] init];
        shapeNode8a = [[SKShapeNode alloc] init];
        shapeNode9a = [[SKShapeNode alloc] init];
        shapeNode10a = [[SKShapeNode alloc] init];
        shapeNode11a = [[SKShapeNode alloc] init];
        shapeNode12a = [[SKShapeNode alloc] init];
        shapeNode13a = [[SKShapeNode alloc] init];
        shapeNode14a = [[SKShapeNode alloc] init];
        shapeNode15a = [[SKShapeNode alloc] init];
        shapeNode16a = [[SKShapeNode alloc] init];
        shapeNode17a = [[SKShapeNode alloc] init];
        shapeNode18a = [[SKShapeNode alloc] init];
        shapeNode19a = [[SKShapeNode alloc] init];
        shapeNode20a = [[SKShapeNode alloc] init];
        shapeNode21a = [[SKShapeNode alloc] init];
        shapeNode22a = [[SKShapeNode alloc] init];
        shapeNode23a = [[SKShapeNode alloc] init];
        shapeNode24a = [[SKShapeNode alloc] init];
        shapeNode25a = [[SKShapeNode alloc] init];
        shapeNode26a = [[SKShapeNode alloc] init];
        shapeNode27a = [[SKShapeNode alloc] init];
        shapeNode28a = [[SKShapeNode alloc] init];
        shapeNode29a = [[SKShapeNode alloc] init];
        shapeNode30a = [[SKShapeNode alloc] init];
        shapeNode31a = [[SKShapeNode alloc] init];
        shapeNode32a = [[SKShapeNode alloc] init];
        shapeNode33a = [[SKShapeNode alloc] init];
        shapeNode34a = [[SKShapeNode alloc] init];
        shapeNode35a = [[SKShapeNode alloc] init];
        shapeNode36a = [[SKShapeNode alloc] init];
        shapeNode37a = [[SKShapeNode alloc] init];
        shapeNode38a = [[SKShapeNode alloc] init];
        shapeNode39a = [[SKShapeNode alloc] init];
        shapeNode40a = [[SKShapeNode alloc] init];
        shapeNode41a = [[SKShapeNode alloc] init];
        shapeNode42a = [[SKShapeNode alloc] init];
        shapeNode43a = [[SKShapeNode alloc] init];
        shapeNode44a = [[SKShapeNode alloc] init];
        shapeNode45a = [[SKShapeNode alloc] init];
        shapeNode46a = [[SKShapeNode alloc] init];
        shapeNode47a = [[SKShapeNode alloc] init];

        
        CGMutablePathRef path1 = CGPathCreateMutable();
        CGMutablePathRef path2 = CGPathCreateMutable();
        CGMutablePathRef path3 = CGPathCreateMutable();
        CGMutablePathRef path4 = CGPathCreateMutable();
        CGMutablePathRef path5 = CGPathCreateMutable();
        CGMutablePathRef path6 = CGPathCreateMutable();
        CGMutablePathRef path7 = CGPathCreateMutable();
        CGMutablePathRef path8 = CGPathCreateMutable();
        CGMutablePathRef path9 = CGPathCreateMutable();
        CGMutablePathRef path10 = CGPathCreateMutable();
        CGMutablePathRef path11 = CGPathCreateMutable();
        CGMutablePathRef path12 = CGPathCreateMutable();
        CGMutablePathRef path13 = CGPathCreateMutable();
        CGMutablePathRef path14 = CGPathCreateMutable();
        CGMutablePathRef path15 = CGPathCreateMutable();
        CGMutablePathRef path16 = CGPathCreateMutable();
        CGMutablePathRef path17 = CGPathCreateMutable();
        CGMutablePathRef path18 = CGPathCreateMutable();
        CGMutablePathRef path19 = CGPathCreateMutable();
        CGMutablePathRef path20 = CGPathCreateMutable();
        CGMutablePathRef path21 = CGPathCreateMutable();
        CGMutablePathRef path22 = CGPathCreateMutable();
        CGMutablePathRef path23 = CGPathCreateMutable();
        CGMutablePathRef path24 = CGPathCreateMutable();
        CGMutablePathRef path25 = CGPathCreateMutable();
        CGMutablePathRef path26 = CGPathCreateMutable();
        CGMutablePathRef path27 = CGPathCreateMutable();
        CGMutablePathRef path28 = CGPathCreateMutable();
        CGMutablePathRef path29 = CGPathCreateMutable();
        CGMutablePathRef path30 = CGPathCreateMutable();
        CGMutablePathRef path31 = CGPathCreateMutable();
        CGMutablePathRef path32 = CGPathCreateMutable();
        CGMutablePathRef path33 = CGPathCreateMutable();
        CGMutablePathRef path34 = CGPathCreateMutable();
        CGMutablePathRef path35 = CGPathCreateMutable();
        CGMutablePathRef path36 = CGPathCreateMutable();
        CGMutablePathRef path37 = CGPathCreateMutable();
        CGMutablePathRef path38 = CGPathCreateMutable();
        CGMutablePathRef path39 = CGPathCreateMutable();
        CGMutablePathRef path40 = CGPathCreateMutable();
        CGMutablePathRef path41 = CGPathCreateMutable();
        CGMutablePathRef path42 = CGPathCreateMutable();
        CGMutablePathRef path43 = CGPathCreateMutable();
        CGMutablePathRef path44 = CGPathCreateMutable();
        CGMutablePathRef path45 = CGPathCreateMutable();
        CGMutablePathRef path46 = CGPathCreateMutable();
        CGMutablePathRef path47 = CGPathCreateMutable();
        
        //Ambient stars
        CGMutablePathRef path1a = CGPathCreateMutable();
        
        //Initial node size
        // (path, CGAffineTransform, side x, side y, radius, start angle, end angle, spin)
        CGPathAddArc(path1, NULL, 9, 9, (9 * cf) / 2, 0.0, (2 * M_PI), NO);
        CGPathAddArc(path2, NULL, 3, 3, (3 * cf) / 2, 0.0, (2 * M_PI), NO);
        CGPathAddArc(path3, NULL, 3, 3, (3 * cf) / 2, 0.0, (2 * M_PI), NO);
        CGPathAddArc(path4, NULL, 4.75, 4.75, (4.75 * cf) / 2, 0.0, (2 * M_PI), NO);
        CGPathAddArc(path5, NULL, 3, 3, (3 * cf) / 2, 0.0, (2 * M_PI), NO);
        CGPathAddArc(path6, NULL, 3, 3, (3 * cf) / 2, 0.0, (2 * M_PI), NO);
        CGPathAddArc(path7, NULL, 2.5, 2.5, (2.5 * cf) / 2, 0.0, (2 * M_PI), NO);
        CGPathAddArc(path8, NULL, 3, 3, (3 * cf) / 2, 0.0, (2 * M_PI), NO);
        CGPathAddArc(path9, NULL, 3, 3, (3 * cf) / 2, 0.0, (2 * M_PI), NO);
        CGPathAddArc(path10, NULL, 3, 3, (3 * cf) / 2, 0.0, (2 * M_PI), NO);
        CGPathAddArc(path11, NULL, 4, 4, (4 * cf) / 2, 0.0, (2 * M_PI), NO);
        CGPathAddArc(path12, NULL, 1.5, 1.5, (1.5 * cf) / 2, 0.0, (2 * M_PI), NO);
        CGPathAddArc(path13, NULL, 2, 2, (2 * cf) / 2, 0.0, (2 * M_PI), NO);
        CGPathAddArc(path14, NULL, 2, 2, (2 * cf) / 2, 0.0, (2 * M_PI), NO);
        CGPathAddArc(path15, NULL, 1.5, 1.5, (1.5 * cf) / 2, 0.0, (2 * M_PI), NO);
        CGPathAddArc(path16, NULL, 1.25, 1.25, (1.25 * cf) / 2, 0.0, (2 * M_PI), NO);
        CGPathAddArc(path17, NULL, 1.25, 1.25, (1.25 * cf) / 2, 0.0, (2 * M_PI), NO);
        CGPathAddArc(path18, NULL, 3, 3, (3 * cf) / 2, 0.0, (2 * M_PI), NO);
        CGPathAddArc(path19, NULL, 1.5, 1.5, (1.5 * cf) / 2, 0.0, (2 * M_PI), NO);
        CGPathAddArc(path20, NULL, 1.5, 1.5, (1.5 * cf) / 2, 0.0, (2 * M_PI), NO);
        CGPathAddArc(path21, NULL, 2, 2, (2 * cf) / 2, 0.0, (2 * M_PI), NO);
        CGPathAddArc(path22, NULL, 2, 2, (2 * cf) / 2, 0.0, (2 * M_PI), NO);
        CGPathAddArc(path23, NULL, 2, 2, (2 * cf) / 2, 0.0, (2 * M_PI), NO);
        CGPathAddArc(path24, NULL, 1.5, 1.5, (1.5 * cf) / 2, 0.0, (2 * M_PI), NO);
        CGPathAddArc(path25, NULL, 1.5, 1.5, (1.5 * cf) / 2, 0.0, (2 * M_PI), NO);
        CGPathAddArc(path26, NULL, 1.5, 1.5, (1.5 * cf) / 2, 0.0, (2 * M_PI), NO);
        CGPathAddArc(path27, NULL, 1.5, 1.5, (1.5 * cf) / 2, 0.0, (2 * M_PI), NO);
        CGPathAddArc(path28, NULL, 1.5, 1.5, (1.5 * cf) / 2, 0.0, (2 * M_PI), NO);
        CGPathAddArc(path29, NULL, 2, 2, (2 * cf) / 2, 0.0, (2 * M_PI), NO);
        CGPathAddArc(path30, NULL, 2, 2, (2 * cf) / 2, 0.0, (2 * M_PI), NO);
        CGPathAddArc(path31, NULL, 1.25, 1.25, (1.25 * cf) / 2, 0.0, (2 * M_PI), NO);
        CGPathAddArc(path32, NULL, 1.25, 1.25, (1.25 * cf) / 2, 0.0, (2 * M_PI), NO);
        CGPathAddArc(path33, NULL, 1.25, 1.25, (1.25 * cf) / 2, 0.0, (2 * M_PI), NO);
        CGPathAddArc(path34, NULL, 1.25, 1.25, (1.25 * cf) / 2, 0.0, (2 * M_PI), NO);
        CGPathAddArc(path35, NULL, 2, 2, (2 * cf) / 2, 0.0, (2 * M_PI), NO);
        CGPathAddArc(path36, NULL, 1, 1, (1 * cf) / 2, 0.0, (2 * M_PI), NO);
        CGPathAddArc(path37, NULL, 1.5, 1.5, (1.5 * cf) / 2, 0.0, (2 * M_PI), NO);
        CGPathAddArc(path38, NULL, 1.5, 1.5, (1.5 * cf) / 2, 0.0, (2 * M_PI), NO);
        CGPathAddArc(path39, NULL, 2, 2, (2 * cf) / 2, 0.0, (2 * M_PI), NO);
        CGPathAddArc(path40, NULL, 1, 1, (1 * cf) / 2, 0.0, (2 * M_PI), NO);
        CGPathAddArc(path41, NULL, 1, 1, (1 * cf) / 2, 0.0, (2 * M_PI), NO);
        CGPathAddArc(path42, NULL, 1.5, 1.5, (1.5 * cf) / 2, 0.0, (2 * M_PI), NO);
        CGPathAddArc(path43, NULL, 1, 1, (1 * cf) / 2, 0.0, (2 * M_PI), NO);
        CGPathAddArc(path44, NULL, 1.5, 1.5, (1.5 * cf) / 2, 0.0, (2 * M_PI), NO);
        CGPathAddArc(path45, NULL, 1.5, 1.5, (1.5 * cf) / 2, 0.0, (2 * M_PI), NO);
        CGPathAddArc(path46, NULL, 1.5, 1.5, (1.5 * cf) / 2, 0.0, (2 * M_PI), NO);
        CGPathAddArc(path47, NULL, 2.5, 2.5, (2.5 * cf) / 2, 0.0, (2 * M_PI), NO);
        
        //Ambient stars
        CGPathAddArc(path1a, NULL, ambSize, ambSize, (ambSize * cf) / 2, 0.0, (2 * M_PI), NO);
        
        shapeNode1.path = path1;
        shapeNode2.path = path2;
        shapeNode3.path = path3;
        shapeNode4.path = path4;
        shapeNode5.path = path5;
        shapeNode6.path = path6;
        shapeNode7.path = path7;
        shapeNode8.path = path8;
        shapeNode9.path = path9;
        shapeNode10.path = path10;
        shapeNode11.path = path11;
        shapeNode12.path = path12;
        shapeNode13.path = path13;
        shapeNode14.path = path14;
        shapeNode15.path = path15;
        shapeNode16.path = path16;
        shapeNode17.path = path17;
        shapeNode18.path = path18;
        shapeNode19.path = path19;
        shapeNode20.path = path20;
        shapeNode21.path = path21;
        shapeNode22.path = path22;
        shapeNode23.path = path23;
        shapeNode24.path = path24;
        shapeNode25.path = path25;
        shapeNode26.path = path26;
        shapeNode27.path = path27;
        shapeNode28.path = path28;
        shapeNode29.path = path29;
        shapeNode30.path = path30;
        shapeNode31.path = path31;
        shapeNode32.path = path32;
        shapeNode33.path = path33;
        shapeNode34.path = path34;
        shapeNode35.path = path35;
        shapeNode36.path = path36;
        shapeNode37.path = path37;
        shapeNode38.path = path38;
        shapeNode39.path = path39;
        shapeNode40.path = path40;
        shapeNode41.path = path41;
        shapeNode42.path = path42;
        shapeNode43.path = path43;
        shapeNode44.path = path44;
        shapeNode45.path = path45;
        shapeNode46.path = path46;
        shapeNode47.path = path47;
        
        //Ambient stars
        shapeNode1a.path = path1a;
        shapeNode2a.path = path1a;
        shapeNode3a.path = path1a;
        shapeNode4a.path = path1a;
        shapeNode5a.path = path1a;
        shapeNode6a.path = path1a;
        shapeNode7a.path = path1a;
        shapeNode8a.path = path1a;
        shapeNode9a.path = path1a;
        shapeNode10a.path = path1a;
        shapeNode11a.path = path1a;
        shapeNode12a.path = path1a;
        shapeNode13a.path = path1a;
        shapeNode14a.path = path1a;
        shapeNode15a.path = path1a;
        shapeNode16a.path = path1a;
        shapeNode17a.path = path1a;
        shapeNode18a.path = path1a;
        shapeNode19a.path = path1a;
        shapeNode20a.path = path1a;
        shapeNode21a.path = path1a;
        shapeNode22a.path = path1a;
        shapeNode23a.path = path1a;
        shapeNode24a.path = path1a;
        shapeNode25a.path = path1a;
        shapeNode26a.path = path1a;
        shapeNode27a.path = path1a;
        shapeNode28a.path = path1a;
        shapeNode29a.path = path1a;
        shapeNode30a.path = path1a;
        shapeNode31a.path = path1a;
        shapeNode32a.path = path1a;
        shapeNode33a.path = path1a;
        shapeNode34a.path = path1a;
        shapeNode35a.path = path1a;
        shapeNode36a.path = path1a;
        shapeNode37a.path = path1a;
        shapeNode38a.path = path1a;
        shapeNode39a.path = path1a;
        shapeNode40a.path = path1a;
        shapeNode41a.path = path1a;
        shapeNode42a.path = path1a;
        shapeNode43a.path = path1a;
        shapeNode44a.path = path1a;
        shapeNode45a.path = path1a;
        shapeNode46a.path = path1a;
        shapeNode47a.path = path1a;
        
        
        //initial node location
        shapeNode1.position = CGPointMake(center.x - ((66 + (sqrt(9) / 2)) * cf), center.y - ((57.5 + (sqrt(9) / 2)) * cf));
        xOrigin1 = shapeNode1.position.x + (sqrt(3) / 2);
        yOrigin1 = shapeNode1.position.y + (sqrt(3) / 2);
        
        shapeNode2.position = CGPointMake(center.x - ((46.5 + (sqrt(3) / 2)) * cf), center.y - ((59.5 + (sqrt(3) / 2)) * cf));
        xOrigin2 = shapeNode2.position.x + (sqrt(3) / 2);
        yOrigin2 = shapeNode2.position.y + (sqrt(3) / 2);
        
        shapeNode3.position = CGPointMake(center.x - ((19 + (sqrt(3) / 2)) * cf), center.y - ((33 + (sqrt(3) / 2)) * cf));
        xOrigin3 = shapeNode3.position.x + (sqrt(3) / 2);
        yOrigin3 = shapeNode3.position.y + (sqrt(3) / 2);
        
        shapeNode4.position = CGPointMake(center.x + ((13 - (sqrt(4.75) / 2)) * cf), center.y - ((26.5 + (sqrt(4.75) / 2)) * cf));
        xOrigin4 = shapeNode4.position.x + (sqrt(4.75) / 2);
        yOrigin4 = shapeNode4.position.y + (sqrt(4.75) / 2);
        
        shapeNode5.position = CGPointMake(center.x - ((9.5 + (sqrt(3) / 2)) * cf), center.y - ((6.5 + (sqrt(3) / 2)) * cf));
        xOrigin5 = shapeNode5.position.x + (sqrt(3) / 2);
        yOrigin5 = shapeNode5.position.y + (sqrt(3) / 2);
        
        shapeNode6.position = CGPointMake(center.x - ((5.5 + (sqrt(3) / 2)) * cf), center.y - ((4.5 + (sqrt(3) / 2)) * cf));
        xOrigin6 = shapeNode6.position.x + (sqrt(3) / 2);
        yOrigin6 = shapeNode6.position.y + (sqrt(3) / 2);
        
        shapeNode7.position = CGPointMake(center.x - ((2 + (sqrt(2.5) / 2)) * cf), center.y - ((2.5 + (sqrt(2.5) / 2)) * cf));
        xOrigin7 = shapeNode7.position.x + (sqrt(2.5) / 2);
        yOrigin7 = shapeNode7.position.y + (sqrt(2.5) / 2);
        
        shapeNode8.position = CGPointMake(center.x + ((4 + (sqrt(3) / 2)) * cf), center.y + ((20 + (sqrt(3) / 2)) * cf));
        xOrigin8 = shapeNode8.position.x + (sqrt(3) / 2);
        yOrigin8 = shapeNode8.position.y + (sqrt(3) / 2);
        
        shapeNode9.position = CGPointMake(center.x - ((22 + (sqrt(4) / 2)) * cf), center.y + ((24 + (sqrt(4) / 2)) * cf));
        xOrigin9 = shapeNode9.position.x + (sqrt(3) / 2);
        yOrigin9 = shapeNode9.position.y + (sqrt(3) / 2);
        
        shapeNode10.position = CGPointMake(center.x - ((57 + (sqrt(3) / 2)) * cf), center.y + ((55.5 + (sqrt(3) / 2)) * cf));
        xOrigin10 = shapeNode10.position.x  + (sqrt(3) / 2);
        yOrigin10 = shapeNode10.position.y + (sqrt(3) / 2);
        
        shapeNode11.position = CGPointMake(center.x + ((45 + (sqrt(4) / 2)) * cf), center.y + ((52 + (sqrt(4) / 2)) * cf));
        xOrigin11 = shapeNode11.position.x  + (sqrt(4) / 2);
        yOrigin11 = shapeNode11.position.y  + (sqrt(4) / 2);
        
        shapeNode12.position = CGPointMake(center.x - ((31.5 + (sqrt(1.5) / 2)) * cf), center.y - ((49.5 + (sqrt(1.5)) / 2) * cf));
        xOrigin12 = shapeNode12.position.x  + (sqrt(1.5) / 2);
        yOrigin12 = shapeNode12.position.y  + (sqrt(1.5) / 2);
        
        shapeNode13.position = CGPointMake(center.x - ((23 + (sqrt(2) / 2)) * cf), center.y - ((46.5 + (sqrt(2) / 2)) * cf));
        xOrigin13 = shapeNode13.position.x + (sqrt(2) / 2);
        yOrigin13 = shapeNode13.position.y  + (sqrt(2) / 2);
        
        shapeNode14.position = CGPointMake(center.x - ((15 + (sqrt(2) / 2)) * cf), center.y - ((49.5 + (sqrt(2) / 2)) * cf));
        xOrigin14 = shapeNode14.position.x  + (sqrt(2) / 2);
        yOrigin14 = shapeNode14.position.y  + (sqrt(2) / 2);
        
        shapeNode15.position = CGPointMake(center.x + ((15 - (sqrt(1.5) / 2)) * cf), center.y - ((51 + (sqrt(1.5)) / 2) * cf));
        xOrigin15 = shapeNode15.position.x  + (sqrt(1.5) / 2);
        yOrigin15 = shapeNode15.position.y  + (sqrt(1.5) / 2);
        
        shapeNode16.position = CGPointMake(center.x + ((9 - (sqrt(1.25) / 2)) * cf), center.y - ((41 + (sqrt(1.25) / 2)) * cf));
        xOrigin16 = shapeNode16.position.x  + (sqrt(1.25) / 2);
        yOrigin16 = shapeNode16.position.y  + (sqrt(1.25) / 2);
        
        shapeNode17.position = CGPointMake(center.x + ((14.5 - (sqrt(1.25) / 2)) * cf), center.y - ((40 + (sqrt(1.25) / 2)) * cf));
        xOrigin17 = shapeNode17.position.x  + (sqrt(1.25) / 2);
        yOrigin17 = shapeNode17.position.y  + (sqrt(1.25) / 2);
        
        shapeNode18.position = CGPointMake(center.x + ((19 - (sqrt(3) / 2)) * cf), center.y - ((17 + (sqrt(3) / 2)) * cf));
        xOrigin18 = shapeNode18.position.x  + (sqrt(3) / 2);
        yOrigin18 = shapeNode18.position.y  + (sqrt(3) / 2);
        
        shapeNode19.position = CGPointMake(center.x + ((38 - (sqrt(1.5) / 2)) * cf), center.y - ((9 + (sqrt(1.5) / 2)) * cf));
        xOrigin19 = shapeNode19.position.x  + (sqrt(1.5) / 2);
        yOrigin19 = shapeNode19.position.y  + (sqrt(1.5) / 2);
        
        shapeNode20.position = CGPointMake(center.x + ((46 - (sqrt(1.5) / 2)) * cf), center.y - ((9.5 + (sqrt(1.5) / 2)) * cf));
        xOrigin20 = shapeNode20.position.x  + (sqrt(1.5) / 2);
        yOrigin20 = shapeNode20.position.y  + (sqrt(1.5) / 2);
        
        shapeNode21.position = CGPointMake(center.x + ((80 - (sqrt(2) / 2)) * cf), center.y - ((35 + (sqrt(2) / 2)) * cf));
        xOrigin21 = shapeNode21.position.x + (sqrt(2) / 2);
        yOrigin21 = shapeNode21.position.y + (sqrt(2) / 2);
        
        shapeNode22.position = CGPointMake(center.x + ((4.5 - (sqrt(2) / 2)) * cf), center.y - ((9.5 + (sqrt(2) / 2)) * cf));
        xOrigin22 = shapeNode22.position.x + (sqrt(2) / 2);
        yOrigin22 = shapeNode22.position.y + (sqrt(2) / 2);
        
        shapeNode23.position = CGPointMake(center.x - ((4.5 + (sqrt(2) / 2)) * cf), center.y + ((30.5 - (sqrt(2) / 2)) * cf));
        xOrigin23 = shapeNode23.position.x + (sqrt(2) / 2);
        yOrigin23 = shapeNode23.position.y + (sqrt(2) / 2);
        
        shapeNode24.position = CGPointMake(center.x - ((27.5 + (sqrt(1.5) / 2)) * cf), center.y + ((36 -  (sqrt(1.5) / 2)) * cf));
        xOrigin24 = shapeNode24.position.x + (sqrt(1.5) / 2);
        yOrigin24 = shapeNode24.position.y + (sqrt(1.5) / 2);
        
        shapeNode25.position = CGPointMake(center.x - ((34.5 + (sqrt(1.5) / 2)) * cf), center.y + ((45 - (sqrt(1.5) / 2)) * cf));
        xOrigin25 = shapeNode25.position.x + (sqrt(1.5) / 2);
        yOrigin25 = shapeNode25.position.y + (sqrt(1.5) / 2);
        
        shapeNode26.position = CGPointMake(center.x - ((31.5 + (sqrt(1.5) / 2)) * cf), center.y + ((47.5 - (sqrt(1.5) / 2)) * cf));
        xOrigin26 = shapeNode26.position.x + (sqrt(1.5) / 2);
        yOrigin26 = shapeNode26.position.y + (sqrt(1.5) / 2);
        
        shapeNode27.position = CGPointMake(center.x - ((28 + (sqrt(1.5) / 2)) * cf), center.y + ((62.5 - (sqrt(1.5) / 2)) * cf));
        xOrigin27 = shapeNode27.position.x + (sqrt(1.5) / 2);
        yOrigin27 = shapeNode27.position.y + (sqrt(1.5) / 2);
        
        shapeNode28.position = CGPointMake(center.x - ((20 + (sqrt(1.5) / 2)) * cf), center.y + ((64.5 - (sqrt(1.5) / 2)) * cf));
        xOrigin28 = shapeNode28.position.x + (sqrt(1.5) / 2);
        yOrigin28 = shapeNode28.position.y + (sqrt(1.5) / 2);
        
        shapeNode29.position = CGPointMake(center.x - ((51.5 + (sqrt(2) / 2)) * cf), center.y - ((30 + (sqrt(2) / 2)) * cf));
        xOrigin29 = shapeNode29.position.x + (sqrt(2) / 2);
        yOrigin29 = shapeNode29.position.y + (sqrt(2) / 2);
        
        shapeNode30.position = CGPointMake(center.x - ((39 + (sqrt(1.5) / 2)) * cf), center.y - ((24.5 + (sqrt(1.5) / 2)) * cf));
        xOrigin30 = shapeNode30.position.x + (sqrt(1.5) / 2);
        yOrigin30 = shapeNode30.position.y + (sqrt(1.5) / 2);
        
        shapeNode31.position = CGPointMake(center.x - ((66.5 + (sqrt(1) / 2)) * cf), center.y + ((11 + (sqrt(1) / 2)) * cf));
        xOrigin31 = shapeNode31.position.x + (sqrt(1) / 2);
        yOrigin31 = shapeNode31.position.y + (sqrt(1) / 2);
        
        shapeNode32.position = CGPointMake(center.x - ((46 + (sqrt(1) / 2)) * cf), center.y + ((15.5 - (sqrt(1) / 2)) * cf));
        xOrigin32 = shapeNode32.position.x + (sqrt(1) / 2);
        yOrigin32 = shapeNode32.position.y + (sqrt(1) / 2);
        
        shapeNode33.position = CGPointMake(center.x - ((53.5 + (sqrt(1) / 2)) * cf), center.y + ((26 - (sqrt(1) / 2)) * cf));
        xOrigin33 = shapeNode33.position.x + (sqrt(1) / 2);
        yOrigin33 = shapeNode33.position.y + (sqrt(1) / 2);
        
        shapeNode34.position = CGPointMake(center.x - ((60.5 + (sqrt(1) / 2)) * cf), center.y + ((36 - (sqrt(1) / 2)) * cf));
        xOrigin34 = shapeNode34.position.x + (sqrt(1) / 2);
        yOrigin34 = shapeNode34.position.y + (sqrt(1) / 2);
        
        shapeNode35.position = CGPointMake(center.x - ((63.5 + (sqrt(2) / 2)) * cf), center.y + ((46.5 - (sqrt(2) / 2)) * cf));
        xOrigin35 = shapeNode35.position.x + (sqrt(2) / 2);
        yOrigin35 = shapeNode35.position.y + (sqrt(2) / 2);
        
        shapeNode36.position = CGPointMake(center.x + ((27 - (sqrt(1) / 2)) * cf), center.y + ((4 - (sqrt(1) / 2)) * cf));
        xOrigin36 = shapeNode36.position.x + (sqrt(1) / 2);
        yOrigin36 = shapeNode36.position.y + (sqrt(1) / 2);
        
        shapeNode37.position = CGPointMake(center.x + ((30 - (sqrt(2) / 2)) * cf), center.y + ((7 - (sqrt(2) / 2)) * cf));
        xOrigin37 = shapeNode37.position.x + (sqrt(2) / 2);
        yOrigin37 = shapeNode37.position.y + (sqrt(2) / 2);
        
        shapeNode38.position = CGPointMake(center.x + ((32.5 - (sqrt(2) / 2)) * cf), center.y + ((19 - (sqrt(2) / 2)) * cf));
        xOrigin38 = shapeNode38.position.x + (sqrt(2) / 2);
        yOrigin38 = shapeNode38.position.y + (sqrt(2) / 2);
        
        shapeNode39.position = CGPointMake(center.x + ((34 - (sqrt(2.5) / 2)) * cf), center.y + ((23.5 - (sqrt(2.5) / 2)) * cf));
        xOrigin39 = shapeNode39.position.x + (sqrt(2.5) / 2);
        yOrigin39 = shapeNode39.position.y + (sqrt(2.5) / 2);
        
        shapeNode40.position = CGPointMake(center.x + ((33.5 - (sqrt(1) / 2)) * cf), center.y + ((30.5 - (sqrt(1) / 2)) * cf));
        xOrigin40 = shapeNode40.position.x + (sqrt(1) / 2);
        yOrigin40 = shapeNode40.position.y + (sqrt(1) / 2);
        
        shapeNode41.position = CGPointMake(center.x + ((30 - (sqrt(1) / 2)) * cf), center.y + ((34.5 - (sqrt(1) / 2)) * cf));
        xOrigin41 = shapeNode41.position.x + (sqrt(1) / 2);
        yOrigin41 = shapeNode41.position.y + (sqrt(1) / 2);
        
        shapeNode42.position = CGPointMake(center.x + ((29 - (sqrt(1) / 2)) * cf), center.y + ((46 - (sqrt(1) / 2)) * cf));
        xOrigin42 = shapeNode42.position.x + (sqrt(1) / 2);
        yOrigin42 = shapeNode42.position.y + (sqrt(1) / 2);
        
        shapeNode43.position = CGPointMake(center.x + ((21 - (sqrt(1) / 2)) * cf), center.y + ((52.5 - (sqrt(1) / 2)) * cf));
        xOrigin43 = shapeNode43.position.x + (sqrt(1) / 2);
        yOrigin43 = shapeNode43.position.y + (sqrt(1) / 2);
        
        shapeNode44.position = CGPointMake(center.x + ((58.5 - (sqrt(1) / 2)) * cf), center.y + ((53 - (sqrt(1) / 2)) * cf));
        xOrigin44 = shapeNode44.position.x + (sqrt(1) / 2);
        yOrigin44 = shapeNode44.position.y + (sqrt(1) / 2);
        
        shapeNode45.position = CGPointMake(center.x + ((51 - (sqrt(1) / 2)) * cf), center.y + ((62 - (sqrt(1) / 2)) * cf));
        xOrigin45 = shapeNode45.position.x + (sqrt(1) / 2);
        yOrigin45 = shapeNode45.position.y + (sqrt(1) / 2);
        
        shapeNode46.position = CGPointMake(center.x + ((75 - (sqrt(1) / 2)) * cf), center.y + ((45.5 - (sqrt(1) / 2)) * cf));
        xOrigin46 = shapeNode46.position.x + (sqrt(1) / 2);
        yOrigin46 = shapeNode46.position.y + (sqrt(1) / 2);
        
        shapeNode47.position = CGPointMake(center.x - ((2.5 - (sqrt(1) / 2)) * cf), center.y - ((59.5 + (sqrt(1) / 2)) * cf));
        xOrigin47 = shapeNode47.position.x + (sqrt(1) / 2);
        yOrigin47 = shapeNode47.position.y + (sqrt(1) / 2);
        
        [self ambientNodes];
        
        //Drawing the node to the view
        
        [self addChild:shapeNode1];
        [self addChild:shapeNode2];
        [self addChild:shapeNode3];
        [self addChild:shapeNode4];
        [self addChild:shapeNode5];
        [self addChild:shapeNode6];
        [self addChild:shapeNode7];
        [self addChild:shapeNode8];
        [self addChild:shapeNode9];
        [self addChild:shapeNode10];
        [self addChild:shapeNode11];
        [self addChild:shapeNode12];
        [self addChild:shapeNode13];
        [self addChild:shapeNode14];
        [self addChild:shapeNode15];
        [self addChild:shapeNode16];
        [self addChild:shapeNode17];
        [self addChild:shapeNode18];
        [self addChild:shapeNode19];
        [self addChild:shapeNode20];
        [self addChild:shapeNode21];
        [self addChild:shapeNode22];
        [self addChild:shapeNode23];
        [self addChild:shapeNode24];
        [self addChild:shapeNode25];
        [self addChild:shapeNode26];
        [self addChild:shapeNode27];
        [self addChild:shapeNode28];
        [self addChild:shapeNode29];
        [self addChild:shapeNode30];
        [self addChild:shapeNode31];
        [self addChild:shapeNode32];
        [self addChild:shapeNode33];
        [self addChild:shapeNode34];
        [self addChild:shapeNode35];
        [self addChild:shapeNode36];
        [self addChild:shapeNode37];
        [self addChild:shapeNode38];
        [self addChild:shapeNode39];
        [self addChild:shapeNode40];
        [self addChild:shapeNode41];
        [self addChild:shapeNode42];
        [self addChild:shapeNode43];
        [self addChild:shapeNode44];
        [self addChild:shapeNode45];
        [self addChild:shapeNode46];
        [self addChild:shapeNode47];
        
        //Ambient stars
        [self addChild:shapeNode1a];
        [self addChild:shapeNode2a];
        [self addChild:shapeNode3a];
        [self addChild:shapeNode4a];
        [self addChild:shapeNode5a];
        [self addChild:shapeNode6a];
        [self addChild:shapeNode7a];
        [self addChild:shapeNode8a];
        [self addChild:shapeNode9a];
        [self addChild:shapeNode10a];
        [self addChild:shapeNode11a];
        [self addChild:shapeNode12a];
        [self addChild:shapeNode13a];
        [self addChild:shapeNode14a];
        [self addChild:shapeNode15a];
        [self addChild:shapeNode16a];
        [self addChild:shapeNode17a];
        [self addChild:shapeNode18a];
        [self addChild:shapeNode19a];
        [self addChild:shapeNode20a];
        [self addChild:shapeNode21a];
        [self addChild:shapeNode22a];
        [self addChild:shapeNode23a];
        [self addChild:shapeNode24a];
        [self addChild:shapeNode25a];
        [self addChild:shapeNode26a];
        [self addChild:shapeNode27a];
        [self addChild:shapeNode28a];
        [self addChild:shapeNode29a];
        [self addChild:shapeNode30a];
        [self addChild:shapeNode31a];
        [self addChild:shapeNode32a];
        [self addChild:shapeNode33a];
        [self addChild:shapeNode34a];
        [self addChild:shapeNode35a];
        [self addChild:shapeNode36a];
        [self addChild:shapeNode37a];
        [self addChild:shapeNode38a];
        [self addChild:shapeNode39a];
        [self addChild:shapeNode40a];
        [self addChild:shapeNode41a];
        [self addChild:shapeNode42a];
        [self addChild:shapeNode43a];
        [self addChild:shapeNode44a];
        [self addChild:shapeNode45a];
        [self addChild:shapeNode46a];
        [self addChild:shapeNode47a];
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
    }
    return self;
}

/*Called as soon as the users touches the screen one time
 *@Return void
 */
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    for (UITouch *touch in touches) {
        if (numTouch < 1) {
            numTouch++;
            count++;
            location = [touch locationInNode:self];
            BHPosX = location.x - (sqrt(.01) / 2);
            BHPosY = location.y  - (sqrt(.01) / 2);
            
            shapeNodeBH = [[SKShapeNode alloc] init];
            CGMutablePathRef pathBH = CGPathCreateMutable();
            CGPathAddArc(pathBH, NULL, 10, 10, (10 * cf) / 2, 0.0, (2 * M_PI), NO);
            shapeNodeBH.path = pathBH;
            shapeNodeBH.position = CGPointMake(BHPosX, BHPosY);
            //shapeNodeBH.fillColor = [SKColor redColor];
            shapeNodeBH.strokeColor = nil;
            [self addChild:shapeNodeBH];
            
            thetaE = sqrt(2 / DBH);
            
            //////////////////////////////////////////////////////////////////////////////////////////////////
            [self initialDistance];
            [self updateMags];
            [self moveNodesOut];
            
            //[self initialMorph];
        }
    }
}

/*Called before each frame is rendered
 *@Return void
 */
-(void)update:(CFTimeInterval)currentTime {
    //Move the nodes out as the user appears to move in towards the blackhole
    if (forward == YES && pauseMovement == NO && reverse == NO && nSteps <= maxSteps && nSteps >= minSteps + 1 && numTouch == 1) {
        nSteps--;
        DBH = pow(10, log10f(minDistance) + (nSteps * dLogZ));
        thetaE = sqrt(2.0 / DBH);
        
        //updating the wavelength of one star from each class (every star in that class will follow)
        float distance = (1 - (1.0 / DBH));
        wavlO5 = wavlS5 * sqrt(distance);
        wavlO2 = wavlS2 * sqrt(distance);
        wavlO1 = wavlS1 * sqrt(distance);
        wavlO13 = wavlS13 * sqrt(distance);
        wavlO28 = wavlS28 * sqrt(distance);
        wavlO11 = wavlS11 * sqrt(distance);
        wavlO9 = wavlS9 * sqrt(distance);
        
        [self colorNodeLoop];
        [self updateMags];
        [self moveNodesOut];
        [self updateDistanceCounter: label dBH4:DBH];
        
    }
    
    //Pause all movement of the nodes
    if (forward == NO && pauseMovement == YES && reverse == NO) {
        [self pauseNodeMovement];
    }
    
    //Move the nodes so that the user appears to move out away from the blackhole
    if (forward == NO && pauseMovement == NO && reverse == YES && nSteps >= minSteps && nSteps <= maxSteps - 1 && numTouch == 1) {
        nSteps++;
        DBH = pow(10, log10f(minDistance) + (nSteps * dLogZ));
        thetaE = sqrt(2.0 / DBH);
        //updating the wavelength of one star from each class (every star in that class will follow)
        float distance = (1 - (1.0 / DBH));
        wavlO5 = wavlS5 * sqrt(distance);
        wavlO2 = wavlS2 * sqrt(distance);
        wavlO1 = wavlS1 * sqrt(distance);
        wavlO13 = wavlS13 * sqrt(distance);
        wavlO28 = wavlS28 * sqrt(distance);
        wavlO11 = wavlS11 * sqrt(distance);
        wavlO9 = wavlS9 * sqrt(distance);
        
        [self colorNodeLoop];
        [self updateMags];
        [self moveNodesIn];
        [self updateDistanceCounter: label dBH4:DBH];
        count++;
    }
    
    //Sets the colors of each star after every update
    //////////////////////////////////////////////////////////////////////////////////////////////////
    shapeNode1.fillColor = colorA;
    shapeNode1.strokeColor = [SKColor clearColor];
    shapeNode2.fillColor = colorB;
    shapeNode2.strokeColor = [SKColor clearColor];
    shapeNode3.fillColor = colorB;
    shapeNode3.strokeColor = [SKColor clearColor];
    shapeNode4.fillColor = colorB;
    shapeNode4.strokeColor = [SKColor clearColor];
    shapeNode5.fillColor = colorO;
    shapeNode5.strokeColor = [SKColor clearColor];
    shapeNode6.fillColor = colorB;
    shapeNode6.strokeColor = [SKColor clearColor];
    shapeNode7.fillColor = colorO;
    shapeNode7.strokeColor = [SKColor clearColor];
    shapeNode8.fillColor = colorB;
    shapeNode8.strokeColor = [SKColor clearColor];
    shapeNode9.fillColor = colorM;
    shapeNode9.strokeColor = [SKColor clearColor];
    shapeNode10.fillColor = colorA;
    shapeNode10.strokeColor = [SKColor clearColor];
    shapeNode11.fillColor = colorK;
    shapeNode11.strokeColor = [SKColor clearColor];
    shapeNode12.fillColor = colorA;
    shapeNode12.strokeColor = [SKColor clearColor];
    shapeNode13.fillColor = colorF;
    shapeNode13.strokeColor = [SKColor clearColor];
    shapeNode14.fillColor = colorA;
    shapeNode14.strokeColor = [SKColor clearColor];
    shapeNode15.fillColor = colorB;
    shapeNode15.strokeColor = [SKColor clearColor];
    shapeNode16.fillColor = colorB;
    shapeNode16.strokeColor = [SKColor clearColor];
    shapeNode17.fillColor = colorB;
    shapeNode17.strokeColor = [SKColor clearColor];
    shapeNode18.fillColor = colorA;
    shapeNode18.strokeColor = [SKColor clearColor];
    shapeNode19.fillColor = colorB;
    shapeNode19.strokeColor = [SKColor clearColor];
    shapeNode20.fillColor = colorB;
    shapeNode20.strokeColor = [SKColor clearColor];
    shapeNode21.fillColor = colorM;
    shapeNode21.strokeColor = [SKColor clearColor];
    shapeNode22.fillColor = colorB;
    shapeNode22.strokeColor = [SKColor clearColor];
    shapeNode23.fillColor = colorO;
    shapeNode23.strokeColor = [SKColor clearColor];
    shapeNode24.fillColor = colorA;
    shapeNode24.strokeColor = [SKColor clearColor];
    shapeNode25.fillColor = colorB;
    shapeNode25.strokeColor = [SKColor clearColor];
    shapeNode26.fillColor = colorB;
    shapeNode26.strokeColor = [SKColor clearColor];
    shapeNode27.fillColor = colorB;
    shapeNode27.strokeColor = [SKColor clearColor];
    shapeNode28.fillColor = colorG;
    shapeNode28.strokeColor = [SKColor clearColor];
    shapeNode29.fillColor = colorB;
    shapeNode29.strokeColor = [SKColor clearColor];
    shapeNode30.fillColor = colorK;
    shapeNode30.strokeColor = [SKColor clearColor];
    shapeNode31.fillColor = colorF;
    shapeNode31.strokeColor = [SKColor clearColor];
    shapeNode32.fillColor = colorF;
    shapeNode32.strokeColor = [SKColor clearColor];
    shapeNode33.fillColor = colorF;
    shapeNode33.strokeColor = [SKColor clearColor];
    shapeNode34.fillColor = colorF;
    shapeNode34.strokeColor = [SKColor clearColor];
    shapeNode35.fillColor = colorG;
    shapeNode35.strokeColor = [SKColor clearColor];
    shapeNode36.fillColor = colorK;
    shapeNode36.strokeColor = [SKColor clearColor];
    shapeNode37.fillColor = colorB;
    shapeNode37.strokeColor = [SKColor clearColor];
    shapeNode38.fillColor = colorB;
    shapeNode38.strokeColor = [SKColor clearColor];
    shapeNode39.fillColor = colorF;
    shapeNode39.strokeColor = [SKColor clearColor];
    shapeNode40.fillColor = colorA;
    shapeNode40.strokeColor = [SKColor clearColor];
    shapeNode41.fillColor = colorA;
    shapeNode41.strokeColor = [SKColor clearColor];
    shapeNode42.fillColor = colorK;
    shapeNode42.strokeColor = [SKColor clearColor];
    shapeNode43.fillColor = colorF;
    shapeNode43.strokeColor = [SKColor clearColor];
    shapeNode44.fillColor = colorG;
    shapeNode44.strokeColor = [SKColor clearColor];
    shapeNode45.fillColor = colorK;
    shapeNode45.strokeColor = [SKColor clearColor];
    shapeNode46.fillColor = colorB;
    shapeNode46.strokeColor = [SKColor clearColor];
    shapeNode47.fillColor = colorF;
    shapeNode47.strokeColor = [SKColor clearColor];
    
    //Ambient stars
    shapeNode1a.fillColor = colorF;
    shapeNode1a.strokeColor = [SKColor clearColor];
    shapeNode2a.fillColor = colorF;
    shapeNode2a.strokeColor = [SKColor clearColor];
    shapeNode3a.fillColor = colorF;
    shapeNode3a.strokeColor = [SKColor clearColor];
    shapeNode4a.fillColor = colorF;
    shapeNode4a.strokeColor = [SKColor clearColor];
    shapeNode5a.fillColor = colorF;
    shapeNode5a.strokeColor = [SKColor clearColor];
    shapeNode6a.fillColor = colorF;
    shapeNode6a.strokeColor = [SKColor clearColor];
    shapeNode7a.fillColor = colorF;
    shapeNode7a.strokeColor = [SKColor clearColor];
    shapeNode8a.fillColor = colorF;
    shapeNode8a.strokeColor = [SKColor clearColor];
    shapeNode9a.fillColor = colorF;
    shapeNode9a.strokeColor = [SKColor clearColor];
    shapeNode10a.fillColor = colorF;
    shapeNode10a.strokeColor = [SKColor clearColor];
    shapeNode11a.fillColor = colorF;
    shapeNode11a.strokeColor = [SKColor clearColor];
    shapeNode12a.fillColor = colorF;
    shapeNode12a.strokeColor = [SKColor clearColor];
    shapeNode13a.fillColor = colorF;
    shapeNode13a.strokeColor = [SKColor clearColor];
    shapeNode14a.fillColor = colorF;
    shapeNode14a.strokeColor = [SKColor clearColor];
    shapeNode15a.fillColor = colorF;
    shapeNode15a.strokeColor = [SKColor clearColor];
    shapeNode16a.fillColor = colorF;
    shapeNode16a.strokeColor = [SKColor clearColor];
    shapeNode17a.fillColor = colorF;
    shapeNode17a.strokeColor = [SKColor clearColor];
    shapeNode18a.fillColor = colorF;
    shapeNode18a.strokeColor = [SKColor clearColor];
    shapeNode19a.fillColor = colorF;
    shapeNode19a.strokeColor = [SKColor clearColor];
    shapeNode20a.fillColor = colorF;
    shapeNode20a.strokeColor = [SKColor clearColor];
    shapeNode21a.fillColor = colorF;
    shapeNode21a.strokeColor = [SKColor clearColor];
    shapeNode22a.fillColor = colorF;
    shapeNode22a.strokeColor = [SKColor clearColor];
    shapeNode23a.fillColor = colorF;
    shapeNode23a.strokeColor = [SKColor clearColor];
    shapeNode24a.fillColor = colorF;
    shapeNode24a.strokeColor = [SKColor clearColor];
    shapeNode25a.fillColor = colorF;
    shapeNode25a.strokeColor = [SKColor clearColor];
    shapeNode26a.fillColor = colorF;
    shapeNode26a.strokeColor = [SKColor clearColor];
    shapeNode27a.fillColor = colorF;
    shapeNode27a.strokeColor = [SKColor clearColor];
    shapeNode28a.fillColor = colorF;
    shapeNode28a.strokeColor = [SKColor clearColor];
    shapeNode29a.fillColor = colorF;
    shapeNode29a.strokeColor = [SKColor clearColor];
    shapeNode30a.fillColor = colorF;
    shapeNode30a.strokeColor = [SKColor clearColor];
    shapeNode31a.fillColor = colorF;
    shapeNode31a.strokeColor = [SKColor clearColor];
    shapeNode32a.fillColor = colorF;
    shapeNode32a.strokeColor = [SKColor clearColor];
    shapeNode33a.fillColor = colorF;
    shapeNode33a.strokeColor = [SKColor clearColor];
    shapeNode34a.fillColor = colorF;
    shapeNode34a.strokeColor = [SKColor clearColor];
    shapeNode35a.fillColor = colorF;
    shapeNode35a.strokeColor = [SKColor clearColor];
    shapeNode36a.fillColor = colorF;
    shapeNode36a.strokeColor = [SKColor clearColor];
    shapeNode37a.fillColor = colorF;
    shapeNode37a.strokeColor = [SKColor clearColor];
    shapeNode38a.fillColor = colorF;
    shapeNode38a.strokeColor = [SKColor clearColor];
    shapeNode39a.fillColor = colorF;
    shapeNode39a.strokeColor = [SKColor clearColor];
    shapeNode40a.fillColor = colorF;
    shapeNode40a.strokeColor = [SKColor clearColor];
    shapeNode41a.fillColor = colorF;
    shapeNode41a.strokeColor = [SKColor clearColor];
    shapeNode42a.fillColor = colorF;
    shapeNode42a.strokeColor = [SKColor clearColor];
    shapeNode43a.fillColor = colorF;
    shapeNode43a.strokeColor = [SKColor clearColor];
    shapeNode44a.fillColor = colorF;
    shapeNode44a.strokeColor = [SKColor clearColor];
    shapeNode45a.fillColor = colorF;
    shapeNode45a.strokeColor = [SKColor clearColor];
    shapeNode46a.fillColor = colorF;
    shapeNode46a.strokeColor = [SKColor clearColor];
    shapeNode47a.fillColor = colorF;
    shapeNode47a.strokeColor = [SKColor clearColor];
    
    //////////////////////////////////////////////////////////////////////////////////////////////////
    
    if (reset) {
        [self resetNodes];
    }
    
}


+ (void)go {
    forward = YES;
    pauseMovement = NO;
    reverse = NO;
}

+ (void)stop {
    forward = NO;
    pauseMovement = YES;
    reverse = NO;
}

+ (void)reverse {
    forward = NO;
    pauseMovement = NO;
    reverse = YES;
}

+ (void)reset {
    reset = YES;
}

- (void)resetNodes {
    
    nSteps = startValue;
    reset = NO;
    pauseMovement = YES;
    DBH = 1.e12;
    thetaE = sqrt(2.0 / DBH);
    startCounter = 0;
    
    //updating the wavelength of one star from each class (every star in that class will follow)
    float distance = (1 - (1.0 / DBH));
    wavlO5 = wavlS5 * sqrt(distance);
    wavlO2 = wavlS2 * sqrt(distance);
    wavlO1 = wavlS1 * sqrt(distance);
    wavlO13 = wavlS13 * sqrt(distance);
    wavlO28 = wavlS28 * sqrt(distance);
    wavlO11 = wavlS11 * sqrt(distance);
    wavlO9 = wavlS9 * sqrt(distance);
    numTouch = 0;
    BHPosX = 0.0;
    BHPosY = 0.0;
    
    
    [self colorNodeLoop];
    [self updateMags];
    [self moveNodesIn];
    DBH = pow(10, log10f(minDistance) + (nSteps * dLogZ));
    [self updateDistanceCounter: label dBH4:DBH];
    
    
}

- (void)updateMags {
    
    deltaMag1 = pow(sqrt(2), 2.5 * log10((.5 * ((delta1i / (sqrt(pow(delta1i, 2) + (4 * pow(thetaE, 2))))) + ((sqrt(pow(delta1i, 2) + (4 * pow(thetaE, 2)))) / delta1i)))));
    
    deltaMag2 = pow(sqrt(2), 2.5 * log10f((.5 * ((delta2i / (sqrt(pow(delta2i, 2) + (4 * pow(thetaE, 2))))) + ((sqrt(pow(delta2i, 2) + (4 * pow(thetaE, 2)))) / delta2i)))));
    
    deltaMag3 = pow(sqrt(2), 2.5 * log10f((.5 * ((delta3i / (sqrt(pow(delta3i, 2) + (4 * pow(thetaE, 2))))) + ((sqrt(pow(delta3i, 2) + (4 * pow(thetaE, 2)))) / delta3i)))));
    
    deltaMag4 = pow(sqrt(2), 2.5 * log10f((.5 * ((delta4i / (sqrt(pow(delta4i, 2) + (4 * pow(thetaE, 2))))) + ((sqrt(pow(delta4i, 2) + (4 * pow(thetaE, 2)))) / delta4i)))));
    
    deltaMag5 = pow(sqrt(2), 2.5 * log10f((.5 * ((delta5i / (sqrt(pow(delta5i, 2) + (4 * pow(thetaE, 2))))) + ((sqrt(pow(delta5i, 2) + (4 * pow(thetaE, 2)))) / delta5i)))));
    
    deltaMag6 = pow(sqrt(2), 2.5 * log10f((.5 * ((delta6i / (sqrt(pow(delta6i, 2) + (4 * pow(thetaE, 2))))) + ((sqrt(pow(delta6i, 2) + (4 * pow(thetaE, 2)))) / delta6i)))));
    
    deltaMag7 = pow(sqrt(2), 2.5 * log10f((.5 * ((delta7i / (sqrt(pow(delta7i, 2) + (4 * pow(thetaE, 2))))) + ((sqrt(pow(delta7i, 2) + (4 * pow(thetaE, 2)))) / delta7i)))));
    
    deltaMag8 = pow(sqrt(2), 2.5 * log10f((.5 * ((delta8i / (sqrt(pow(delta8i, 2) + (4 * pow(thetaE, 2))))) + ((sqrt(pow(delta8i, 2) + (4 * pow(thetaE, 2)))) / delta8i)))));
    
    deltaMag9 = pow(sqrt(2), 2.5 * log10f((.5 * ((delta9i / (sqrt(pow(delta9i, 2) + (4 * pow(thetaE, 2))))) + ((sqrt(pow(delta9i, 2) + (4 * pow(thetaE, 2)))) / delta9i)))));
    
    deltaMag10 = pow(sqrt(2), 2.5 * log10f((.5 * ((delta10i / (sqrt(pow(delta10i, 2) + (4 * pow(thetaE, 2))))) + ((sqrt(pow(delta10i, 2) + (4 * pow(thetaE, 2)))) / delta10i)))));
    
    deltaMag11 = pow(sqrt(2), 2.5 * log10f((.5 * ((delta11i / (sqrt(pow(delta11i, 2) + (4 * pow(thetaE, 2))))) + ((sqrt(pow(delta11i, 2) + (4 * pow(thetaE, 2)))) / delta11i)))));
    
    deltaMag12 = pow(sqrt(2), 2.5 * log10f((.5 * ((delta12i / (sqrt(pow(delta12i, 2) + (4 * pow(thetaE, 2))))) + ((sqrt(pow(delta12i, 2) + (4 * pow(thetaE, 2)))) / delta12i)))));
    
    deltaMag13 = pow(sqrt(2), 2.5 * log10f((.5 * ((delta13i / (sqrt(pow(delta13i, 2) + (4 * pow(thetaE, 2))))) + ((sqrt(pow(delta13i, 2) + (4 * pow(thetaE, 2)))) / delta13i)))));
    
    deltaMag14 = pow(sqrt(2), 2.5 * log10f((.5 * ((delta14i / (sqrt(pow(delta14i, 2) + (4 * pow(thetaE, 2))))) + ((sqrt(pow(delta14i, 2) + (4 * pow(thetaE, 2)))) / delta14i)))));
    
    deltaMag15 = pow(sqrt(2), 2.5 * log10f((.5 * ((delta15i / (sqrt(pow(delta15i, 2) + (4 * pow(thetaE, 2))))) + ((sqrt(pow(delta15i, 2) + (4 * pow(thetaE, 2)))) / delta15i)))));
    
    deltaMag16 = pow(sqrt(2), 2.5 * log10f((.5 * ((delta16i / (sqrt(pow(delta16i, 2) + (4 * pow(thetaE, 2))))) + ((sqrt(pow(delta16i, 2) + (4 * pow(thetaE, 2)))) / delta16i)))));
    
    deltaMag17 = pow(sqrt(2), 2.5 * log10f((.5 * ((delta17i / (sqrt(pow(delta17i, 2) + (4 * pow(thetaE, 2))))) + ((sqrt(pow(delta17i, 2) + (4 * pow(thetaE, 2)))) / delta17i)))));
    
    deltaMag18 = pow(sqrt(2), 2.5 * log10f((.5 * ((delta18i / (sqrt(pow(delta18i, 2) + (4 * pow(thetaE, 2))))) + ((sqrt(pow(delta18i, 2) + (4 * pow(thetaE, 2)))) / delta18i)))));
    
    deltaMag19 = pow(sqrt(2), 2.5 * log10f((.5 * ((delta19i / (sqrt(pow(delta19i, 2) + (4 * pow(thetaE, 2))))) + ((sqrt(pow(delta19i, 2) + (4 * pow(thetaE, 2)))) / delta19i)))));
    
    deltaMag20 = pow(sqrt(2), 2.5 * log10f((.5 * ((delta20i / (sqrt(pow(delta20i, 2) + (4 * pow(thetaE, 2))))) + ((sqrt(pow(delta20i, 2) + (4 * pow(thetaE, 2)))) / delta20i)))));
    
    deltaMag21 = pow(sqrt(2), 2.5 * log10f((.5 * ((delta21i / (sqrt(pow(delta21i, 2) + (4 * pow(thetaE, 2))))) + ((sqrt(pow(delta21i, 2) + (4 * pow(thetaE, 2)))) / delta21i)))));
    
    deltaMag22 = pow(sqrt(2), 2.5 * log10f((.5 * ((delta22i / (sqrt(pow(delta22i, 2) + (4 * pow(thetaE, 2))))) + ((sqrt(pow(delta22i, 2) + (4 * pow(thetaE, 2)))) / delta22i)))));
    
    deltaMag23 = pow(sqrt(2), 2.5 * log10f((.5 * ((delta23i / (sqrt(pow(delta23i, 2) + (4 * pow(thetaE, 2))))) + ((sqrt(pow(delta23i, 2) + (4 * pow(thetaE, 2)))) / delta23i)))));
    
    deltaMag24 = pow(sqrt(2), 2.5 * log10f((.5 * ((delta24i / (sqrt(pow(delta24i, 2) + (4 * pow(thetaE, 2))))) + ((sqrt(pow(delta24i, 2) + (4 * pow(thetaE, 2)))) / delta24i)))));
    
    deltaMag25 = pow(sqrt(2), 2.5 * log10f((.5 * ((delta25i / (sqrt(pow(delta25i, 2) + (4 * pow(thetaE, 2))))) + ((sqrt(pow(delta25i, 2) + (4 * pow(thetaE, 2)))) / delta25i)))));
    
    deltaMag26 = pow(sqrt(2), 2.5 * log10f((.5 * ((delta26i / (sqrt(pow(delta26i, 2) + (4 * pow(thetaE, 2))))) + ((sqrt(pow(delta26i, 2) + (4 * pow(thetaE, 2)))) / delta26i)))));
    
    deltaMag27 = pow(sqrt(2), 2.5 * log10f((.5 * ((delta27i / (sqrt(pow(delta27i, 2) + (4 * pow(thetaE, 2))))) + ((sqrt(pow(delta27i, 2) + (4 * pow(thetaE, 2)))) / delta27i)))));
    
    deltaMag28 = pow(sqrt(2), 2.5 * log10f((.5 * ((delta28i / (sqrt(pow(delta28i, 2) + (4 * pow(thetaE, 2))))) + ((sqrt(pow(delta28i, 2) + (4 * pow(thetaE, 2)))) / delta28i)))));
    
    deltaMag29 = pow(sqrt(2), 2.5 * log10f((.5 * ((delta29i / (sqrt(pow(delta29i, 2) + (4 * pow(thetaE, 2))))) + ((sqrt(pow(delta29i, 2) + (4 * pow(thetaE, 2)))) / delta29i)))));
    
    deltaMag30 = pow(sqrt(2), 2.5 * log10f((.5 * ((delta30i / (sqrt(pow(delta30i, 2) + (4 * pow(thetaE, 2))))) + ((sqrt(pow(delta30i, 2) + (4 * pow(thetaE, 2)))) / delta30i)))));
    
    deltaMag31 = pow(sqrt(2), 2.5 * log10f((.5 * ((delta31i / (sqrt(pow(delta31i, 2) + (4 * pow(thetaE, 2))))) + ((sqrt(pow(delta31i, 2) + (4 * pow(thetaE, 2)))) / delta31i)))));
    
    deltaMag32 = pow(sqrt(2), 2.5 * log10f((.5 * ((delta32i / (sqrt(pow(delta32i, 2) + (4 * pow(thetaE, 2))))) + ((sqrt(pow(delta32i, 2) + (4 * pow(thetaE, 2)))) / delta32i)))));
    
    deltaMag33 = pow(sqrt(2), 2.5 * log10f((.5 * ((delta33i / (sqrt(pow(delta33i, 2) + (4 * pow(thetaE, 2))))) + ((sqrt(pow(delta33i, 2) + (4 * pow(thetaE, 2)))) / delta33i)))));
    
    deltaMag34 = pow(sqrt(2), 2.5 * log10f((.5 * ((delta34i / (sqrt(pow(delta34i, 2) + (4 * pow(thetaE, 2))))) + ((sqrt(pow(delta34i, 2) + (4 * pow(thetaE, 2)))) / delta34i)))));
    
    deltaMag35 = pow(sqrt(2), 2.5 * log10f((.5 * ((delta35i / (sqrt(pow(delta35i, 2) + (4 * pow(thetaE, 2))))) + ((sqrt(pow(delta35i, 2) + (4 * pow(thetaE, 2)))) / delta35i)))));
    
    deltaMag36 = pow(sqrt(2), 2.5 * log10f((.5 * ((delta36i / (sqrt(pow(delta36i, 2) + (4 * pow(thetaE, 2))))) + ((sqrt(pow(delta36i, 2) + (4 * pow(thetaE, 2)))) / delta36i)))));
    
    deltaMag37 = pow(sqrt(2), 2.5 * log10f((.5 * ((delta37i / (sqrt(pow(delta37i, 2) + (4 * pow(thetaE, 2))))) + ((sqrt(pow(delta37i, 2) + (4 * pow(thetaE, 2)))) / delta37i)))));
    
    deltaMag38 = pow(sqrt(2), 2.5 * log10f((.5 * ((delta38i / (sqrt(pow(delta38i, 2) + (4 * pow(thetaE, 2))))) + ((sqrt(pow(delta38i, 2) + (4 * pow(thetaE, 2)))) / delta38i)))));
    
    deltaMag39 = pow(sqrt(2), 2.5 * log10f((.5 * ((delta39i / (sqrt(pow(delta39i, 2) + (4 * pow(thetaE, 2))))) + ((sqrt(pow(delta39i, 2) + (4 * pow(thetaE, 2)))) / delta39i)))));
    
    deltaMag40 = pow(sqrt(2), 2.5 * log10f((.5 * ((delta40i / (sqrt(pow(delta40i, 2) + (4 * pow(thetaE, 2))))) + ((sqrt(pow(delta40i, 2) + (4 * pow(thetaE, 2)))) / delta40i)))));
    
    deltaMag41 = pow(sqrt(2), 2.5 * log10f((.5 * ((delta41i / (sqrt(pow(delta41i, 2) + (4 * pow(thetaE, 2))))) + ((sqrt(pow(delta41i, 2) + (4 * pow(thetaE, 2)))) / delta41i)))));
    
    deltaMag42 = pow(sqrt(2), 2.5 * log10f((.5 * ((delta42i / (sqrt(pow(delta42i, 2) + (4 * pow(thetaE, 2))))) + ((sqrt(pow(delta42i, 2) + (4 * pow(thetaE, 2)))) / delta42i)))));
    
    deltaMag43 = pow(sqrt(2), 2.5 * log10f((.5 * ((delta43i / (sqrt(pow(delta43i, 2) + (4 * pow(thetaE, 2))))) + ((sqrt(pow(delta43i, 2) + (4 * pow(thetaE, 2)))) / delta43i)))));
    
    deltaMag44 = pow(sqrt(2), 2.5 * log10f((.5 * ((delta44i / (sqrt(pow(delta44i, 2) + (4 * pow(thetaE, 2))))) + ((sqrt(pow(delta44i, 2) + (4 * pow(thetaE, 2)))) / delta44i)))));
    
    deltaMag45 = pow(sqrt(2), 2.5 * log10f((.5 * ((delta45i / (sqrt(pow(delta45i, 2) + (4 * pow(thetaE, 2))))) + ((sqrt(pow(delta45i, 2) + (4 * pow(thetaE, 2)))) / delta45i)))));
    
    deltaMag46 = pow(sqrt(2), 2.5 * log10f((.5 * ((delta46i / (sqrt(pow(delta46i, 2) + (4 * pow(thetaE, 2))))) + ((sqrt(pow(delta46i, 2) + (4 * pow(thetaE, 2)))) / delta46i)))));
    
    deltaMag47 = pow(sqrt(2), 2.5 * log10f((.5 * ((delta47i / (sqrt(pow(delta47i, 2) + (4 * pow(thetaE, 2))))) + ((sqrt(pow(delta47i, 2) + (4 * pow(thetaE, 2)))) / delta47i)))));
    
    
    //Ambient Nodes
    deltaMag1a = pow(sqrt(2), 2.5 * log10((.5 * ((delta1ia / (sqrt(pow(delta1ia, 2) + (4 * pow(thetaE, 2))))) + ((sqrt(pow(delta1ia, 2) + (4 * pow(thetaE, 2)))) / delta1ia)))));
    deltaMag2a = pow(sqrt(2), 2.5 * log10f((.5 * ((delta2ia / (sqrt(pow(delta2ia, 2) + (4 * pow(thetaE, 2))))) + ((sqrt(pow(delta2ia, 2) + (4 * pow(thetaE, 2)))) / delta2ia)))));
    deltaMag3a = pow(sqrt(2), 2.5 * log10f((.5 * ((delta3ia / (sqrt(pow(delta3ia, 2) + (4 * pow(thetaE, 2))))) + ((sqrt(pow(delta3ia, 2) + (4 * pow(thetaE, 2)))) / delta3ia)))));
    deltaMag4a = pow(sqrt(2), 2.5 * log10f((.5 * ((delta4ia / (sqrt(pow(delta4ia, 2) + (4 * pow(thetaE, 2))))) + ((sqrt(pow(delta4ia, 2) + (4 * pow(thetaE, 2)))) / delta4ia)))));
    deltaMag5a = pow(sqrt(2), 2.5 * log10f((.5 * ((delta5ia / (sqrt(pow(delta5ia, 2) + (4 * pow(thetaE, 2))))) + ((sqrt(pow(delta5ia, 2) + (4 * pow(thetaE, 2)))) / delta5ia)))));
    deltaMag6a = pow(sqrt(2), 2.5 * log10f((.5 * ((delta6ia / (sqrt(pow(delta6ia, 2) + (4 * pow(thetaE, 2))))) + ((sqrt(pow(delta6ia, 2) + (4 * pow(thetaE, 2)))) / delta6ia)))));
    deltaMag7a = pow(sqrt(2), 2.5 * log10f((.5 * ((delta7ia / (sqrt(pow(delta7ia, 2) + (4 * pow(thetaE, 2))))) + ((sqrt(pow(delta7ia, 2) + (4 * pow(thetaE, 2)))) / delta7ia)))));
    deltaMag8a = pow(sqrt(2), 2.5 * log10f((.5 * ((delta8ia / (sqrt(pow(delta8ia, 2) + (4 * pow(thetaE, 2))))) + ((sqrt(pow(delta8ia, 2) + (4 * pow(thetaE, 2)))) / delta8ia)))));
    deltaMag9a = pow(sqrt(2), 2.5 * log10f((.5 * ((delta9ia / (sqrt(pow(delta9ia, 2) + (4 * pow(thetaE, 2))))) + ((sqrt(pow(delta9ia, 2) + (4 * pow(thetaE, 2)))) / delta9ia)))));
    deltaMag10a = pow(sqrt(2), 2.5 * log10f((.5 * ((delta10ia / (sqrt(pow(delta10ia, 2) + (4 * pow(thetaE, 2))))) + ((sqrt(pow(delta10ia, 2) + (4 * pow(thetaE, 2)))) / delta10ia)))));
    deltaMag11a = pow(sqrt(2), 2.5 * log10f((.5 * ((delta11ia / (sqrt(pow(delta11ia, 2) + (4 * pow(thetaE, 2))))) + ((sqrt(pow(delta11ia, 2) + (4 * pow(thetaE, 2)))) / delta11ia)))));
    deltaMag12a = pow(sqrt(2), 2.5 * log10f((.5 * ((delta12ia / (sqrt(pow(delta12ia, 2) + (4 * pow(thetaE, 2))))) + ((sqrt(pow(delta12ia, 2) + (4 * pow(thetaE, 2)))) / delta12ia)))));
    deltaMag13a = pow(sqrt(2), 2.5 * log10f((.5 * ((delta13ia / (sqrt(pow(delta13ia, 2) + (4 * pow(thetaE, 2))))) + ((sqrt(pow(delta13ia, 2) + (4 * pow(thetaE, 2)))) / delta13ia)))));
    deltaMag14a = pow(sqrt(2), 2.5 * log10f((.5 * ((delta14ia / (sqrt(pow(delta14ia, 2) + (4 * pow(thetaE, 2))))) + ((sqrt(pow(delta14ia, 2) + (4 * pow(thetaE, 2)))) / delta14ia)))));
    deltaMag15a = pow(sqrt(2), 2.5 * log10f((.5 * ((delta15ia / (sqrt(pow(delta15ia, 2) + (4 * pow(thetaE, 2))))) + ((sqrt(pow(delta15ia, 2) + (4 * pow(thetaE, 2)))) / delta15ia)))));
    deltaMag16a = pow(sqrt(2), 2.5 * log10f((.5 * ((delta16ia / (sqrt(pow(delta16ia, 2) + (4 * pow(thetaE, 2))))) + ((sqrt(pow(delta16ia, 2) + (4 * pow(thetaE, 2)))) / delta16ia)))));
    deltaMag17a = pow(sqrt(2), 2.5 * log10f((.5 * ((delta17ia / (sqrt(pow(delta17ia, 2) + (4 * pow(thetaE, 2))))) + ((sqrt(pow(delta17ia, 2) + (4 * pow(thetaE, 2)))) / delta17ia)))));
    deltaMag18a = pow(sqrt(2), 2.5 * log10f((.5 * ((delta18ia / (sqrt(pow(delta18ia, 2) + (4 * pow(thetaE, 2))))) + ((sqrt(pow(delta18ia, 2) + (4 * pow(thetaE, 2)))) / delta18ia)))));
    deltaMag19a = pow(sqrt(2), 2.5 * log10f((.5 * ((delta19ia / (sqrt(pow(delta19ia, 2) + (4 * pow(thetaE, 2))))) + ((sqrt(pow(delta19ia, 2) + (4 * pow(thetaE, 2)))) / delta19ia)))));
    deltaMag20a = pow(sqrt(2), 2.5 * log10f((.5 * ((delta20ia / (sqrt(pow(delta20ia, 2) + (4 * pow(thetaE, 2))))) + ((sqrt(pow(delta20ia, 2) + (4 * pow(thetaE, 2)))) / delta20ia)))));
    deltaMag21a = pow(sqrt(2), 2.5 * log10f((.5 * ((delta21ia / (sqrt(pow(delta21ia, 2) + (4 * pow(thetaE, 2))))) + ((sqrt(pow(delta21ia, 2) + (4 * pow(thetaE, 2)))) / delta21ia)))));
    deltaMag22a = pow(sqrt(2), 2.5 * log10f((.5 * ((delta22ia / (sqrt(pow(delta22ia, 2) + (4 * pow(thetaE, 2))))) + ((sqrt(pow(delta22ia, 2) + (4 * pow(thetaE, 2)))) / delta22ia)))));
    deltaMag23a = pow(sqrt(2), 2.5 * log10f((.5 * ((delta23ia / (sqrt(pow(delta23ia, 2) + (4 * pow(thetaE, 2))))) + ((sqrt(pow(delta23ia, 2) + (4 * pow(thetaE, 2)))) / delta23ia)))));
    deltaMag24a = pow(sqrt(2), 2.5 * log10f((.5 * ((delta24ia / (sqrt(pow(delta24ia, 2) + (4 * pow(thetaE, 2))))) + ((sqrt(pow(delta24ia, 2) + (4 * pow(thetaE, 2)))) / delta24ia)))));
    deltaMag25a = pow(sqrt(2), 2.5 * log10f((.5 * ((delta25ia / (sqrt(pow(delta25ia, 2) + (4 * pow(thetaE, 2))))) + ((sqrt(pow(delta25ia, 2) + (4 * pow(thetaE, 2)))) / delta25ia)))));
    deltaMag26a = pow(sqrt(2), 2.5 * log10f((.5 * ((delta26ia / (sqrt(pow(delta26ia, 2) + (4 * pow(thetaE, 2))))) + ((sqrt(pow(delta26ia, 2) + (4 * pow(thetaE, 2)))) / delta26ia)))));
    deltaMag27a = pow(sqrt(2), 2.5 * log10f((.5 * ((delta27ia / (sqrt(pow(delta27ia, 2) + (4 * pow(thetaE, 2))))) + ((sqrt(pow(delta27ia, 2) + (4 * pow(thetaE, 2)))) / delta27ia)))));
    deltaMag28a = pow(sqrt(2), 2.5 * log10f((.5 * ((delta28ia / (sqrt(pow(delta28ia, 2) + (4 * pow(thetaE, 2))))) + ((sqrt(pow(delta28ia, 2) + (4 * pow(thetaE, 2)))) / delta28ia)))));
    deltaMag29a = pow(sqrt(2), 2.5 * log10f((.5 * ((delta29ia / (sqrt(pow(delta29ia, 2) + (4 * pow(thetaE, 2))))) + ((sqrt(pow(delta29ia, 2) + (4 * pow(thetaE, 2)))) / delta29ia)))));
    deltaMag30a = pow(sqrt(2), 2.5 * log10f((.5 * ((delta30ia / (sqrt(pow(delta30ia, 2) + (4 * pow(thetaE, 2))))) + ((sqrt(pow(delta30ia, 2) + (4 * pow(thetaE, 2)))) / delta30ia)))));
    deltaMag31a = pow(sqrt(2), 2.5 * log10f((.5 * ((delta31ia / (sqrt(pow(delta31ia, 2) + (4 * pow(thetaE, 2))))) + ((sqrt(pow(delta31ia, 2) + (4 * pow(thetaE, 2)))) / delta31ia)))));
    deltaMag32a = pow(sqrt(2), 2.5 * log10f((.5 * ((delta32ia / (sqrt(pow(delta32ia, 2) + (4 * pow(thetaE, 2))))) + ((sqrt(pow(delta32ia, 2) + (4 * pow(thetaE, 2)))) / delta32ia)))));
    deltaMag33a = pow(sqrt(2), 2.5 * log10f((.5 * ((delta33ia / (sqrt(pow(delta33ia, 2) + (4 * pow(thetaE, 2))))) + ((sqrt(pow(delta33ia, 2) + (4 * pow(thetaE, 2)))) / delta33ia)))));
    deltaMag34a = pow(sqrt(2), 2.5 * log10f((.5 * ((delta34ia / (sqrt(pow(delta34ia, 2) + (4 * pow(thetaE, 2))))) + ((sqrt(pow(delta34ia, 2) + (4 * pow(thetaE, 2)))) / delta34ia)))));
    deltaMag35a = pow(sqrt(2), 2.5 * log10f((.5 * ((delta35ia / (sqrt(pow(delta35ia, 2) + (4 * pow(thetaE, 2))))) + ((sqrt(pow(delta35ia, 2) + (4 * pow(thetaE, 2)))) / delta35ia)))));
    deltaMag36a = pow(sqrt(2), 2.5 * log10f((.5 * ((delta36ia / (sqrt(pow(delta36ia, 2) + (4 * pow(thetaE, 2))))) + ((sqrt(pow(delta36ia, 2) + (4 * pow(thetaE, 2)))) / delta36ia)))));
    deltaMag37a = pow(sqrt(2), 2.5 * log10f((.5 * ((delta37ia / (sqrt(pow(delta37ia, 2) + (4 * pow(thetaE, 2))))) + ((sqrt(pow(delta37ia, 2) + (4 * pow(thetaE, 2)))) / delta37ia)))));
    deltaMag38a = pow(sqrt(2), 2.5 * log10f((.5 * ((delta38ia / (sqrt(pow(delta38ia, 2) + (4 * pow(thetaE, 2))))) + ((sqrt(pow(delta38ia, 2) + (4 * pow(thetaE, 2)))) / delta38ia)))));
    deltaMag39a = pow(sqrt(2), 2.5 * log10f((.5 * ((delta39ia / (sqrt(pow(delta39ia, 2) + (4 * pow(thetaE, 2))))) + ((sqrt(pow(delta39ia, 2) + (4 * pow(thetaE, 2)))) / delta39ia)))));
    deltaMag40a = pow(sqrt(2), 2.5 * log10f((.5 * ((delta40ia / (sqrt(pow(delta40ia, 2) + (4 * pow(thetaE, 2))))) + ((sqrt(pow(delta40ia, 2) + (4 * pow(thetaE, 2)))) / delta40ia)))));
    deltaMag41a = pow(sqrt(2), 2.5 * log10f((.5 * ((delta41ia / (sqrt(pow(delta41ia, 2) + (4 * pow(thetaE, 2))))) + ((sqrt(pow(delta41ia, 2) + (4 * pow(thetaE, 2)))) / delta41ia)))));
    deltaMag42a = pow(sqrt(2), 2.5 * log10f((.5 * ((delta42ia / (sqrt(pow(delta42ia, 2) + (4 * pow(thetaE, 2))))) + ((sqrt(pow(delta42ia, 2) + (4 * pow(thetaE, 2)))) / delta42ia)))));
    deltaMag43a = pow(sqrt(2), 2.5 * log10f((.5 * ((delta43ia / (sqrt(pow(delta43ia, 2) + (4 * pow(thetaE, 2))))) + ((sqrt(pow(delta43ia, 2) + (4 * pow(thetaE, 2)))) / delta43ia)))));
    deltaMag44a = pow(sqrt(2), 2.5 * log10f((.5 * ((delta44ia / (sqrt(pow(delta44ia, 2) + (4 * pow(thetaE, 2))))) + ((sqrt(pow(delta44ia, 2) + (4 * pow(thetaE, 2)))) / delta44ia)))));
    deltaMag45a = pow(sqrt(2), 2.5 * log10f((.5 * ((delta45ia / (sqrt(pow(delta45ia, 2) + (4 * pow(thetaE, 2))))) + ((sqrt(pow(delta45ia, 2) + (4 * pow(thetaE, 2)))) / delta45ia)))));
    deltaMag46a = pow(sqrt(2), 2.5 * log10f((.5 * ((delta46ia / (sqrt(pow(delta46ia, 2) + (4 * pow(thetaE, 2))))) + ((sqrt(pow(delta46ia, 2) + (4 * pow(thetaE, 2)))) / delta46ia)))));
    deltaMag47a = pow(sqrt(2), 2.5 * log10f((.5 * ((delta47ia / (sqrt(pow(delta47ia, 2) + (4 * pow(thetaE, 2))))) + ((sqrt(pow(delta47ia, 2) + (4 * pow(thetaE, 2)))) / delta47ia)))));
    
}

- (void)pauseNodeMovement {
    stop = [SKAction moveByX:0 y:0 duration:0.01];
    for (int i = 0; i < [shapeNodes count]; i++) {
        SKShapeNode *node = [(shapeNodes)objectAtIndex:i];
        [node runAction: [SKAction repeatAction:stop count:1]];
    }
}

+ (void)colorShift:(float)waveLength returnBlock:(void (^)(float red, float green, float blue))returnBlock{
    redVar = 255;
    greenVar = 255;
    blueVar = 255;
    if (waveLength < 530) {
        redVar = (waveLength - 465) * (255.0 / 65.0);
        redVar = MAX(0, redVar);
    }
    if (waveLength < 530) {
        greenVar = ((waveLength - 465) * (127.0 / 65.0)) + 128;
        greenVar = MAX(128, greenVar);
    }
    if (waveLength > 580) {
        greenVar = 255 - (waveLength - 580) * (51.0 / 13.0);
        greenVar = MIN(255, greenVar);
        
    }
    if (waveLength > 530) {
        blueVar = 255 - ((waveLength - 530) * (102.0 / 63.0));
        blueVar = MIN(255, blueVar);
    }
    returnBlock(redVar, greenVar, blueVar);
}

/* Updates the distance label
 * @return void
 */
- (void) updateDistanceCounter:(NSString*) label dBH4:(float) dBH4 {
    
    //updates the distance label with the new distance from the blackhole
    distanceString = [NSString stringWithFormat:@"%@ r/Rs: %g ", label, dBH4];
    distanceLabel.text = distanceString;
}

- (void) moveNodesOut {
    if (count >= 1) {
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        //Node paths
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx1new = ((xOrigin1 + dfx1Total) - BHPosX) * 0.001147;
        dfy1new = ((yOrigin1 + dfy1Total) - BHPosY) * 0.001147;
        delta1New = sqrt(pow(dfx1new, 2) + pow(dfy1new, 2));
        //delta1New = MIN(.99, delta1New);
        deltaTheta1New = (sqrt((1 + cosf(delta1New)) / (1 - cosf(delta1New)))) * (1 / DBH);
        moveNode1x = (MAX(0.0, deltaTheta1New - deltaTheta1i) * (dfx1i / delta1i)) / .001147;
        moveNode1y = (MAX(0.0, deltaTheta1New - deltaTheta1i) * (dfy1i / delta1i)) / .001147;
        dfx1Total += moveNode1x;
        dfy1Total += moveNode1y;
        movement1 = [SKAction moveByX:moveNode1x y:moveNode1y duration:0.01];
        deltaTheta1i = MAX(deltaTheta1i, deltaTheta1New);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx2new = ((xOrigin2 + dfx2Total) - BHPosX) * 0.001147;
        dfy2new = ((yOrigin2 + dfy2Total) - BHPosY) * 0.001147;
        delta2New = sqrt(pow(dfx2new, 2) + pow(dfy2new, 2));
        //delta2New = MIN(.99, delta2New);
        deltaTheta2New = (sqrt((1 + cosf(delta2New)) / (1 - cosf(delta2New)))) * (1 / DBH);
        moveNode2x = (MAX(0.0, deltaTheta2New - deltaTheta2i) * (dfx2i / delta2i)) / .001147;
        moveNode2y = (MAX(0.0, deltaTheta2New - deltaTheta2i) * (dfy2i / delta2i)) / .001147;
        dfx2Total += moveNode2x;
        dfy2Total += moveNode2y;
        movement2 = [SKAction moveByX:moveNode2x y:moveNode2y duration:0.01];
        deltaTheta2i = MAX(deltaTheta2i, deltaTheta2New);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx3new = ((xOrigin3 + dfx3Total) - BHPosX) * 0.001147;
        dfy3new = ((yOrigin3 + dfy3Total) - BHPosY) * 0.001147;
        delta3New = sqrt(pow(dfx3new, 2) + pow(dfy3new, 2));
        //delta3New = MIN(.99, delta3New);
        deltaTheta3New = (sqrt((1 + cosf(delta3New)) / (1 - cosf(delta3New)))) * (1 / DBH);
        moveNode3x = (MAX(0.0, deltaTheta3New - deltaTheta3i) * (dfx3i / delta3i)) / .001147;
        moveNode3y = (MAX(0.0, deltaTheta3New - deltaTheta3i) * (dfy3i / delta3i)) / .001147;
        dfx3Total += moveNode3x;
        dfy3Total += moveNode3y;
        movement3 = [SKAction moveByX:moveNode3x y:moveNode3y duration:0.01];
        deltaTheta3i = MAX(deltaTheta3i, deltaTheta3New);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx4new = ((xOrigin4 + dfx4Total) - BHPosX) * 0.001147;
        dfy4new = ((yOrigin4 + dfy4Total) - BHPosY) * 0.001147;
        delta4New = sqrt(pow(dfx4new, 2) + pow(dfy4new, 2));
        //delta4New = MIN(.99, delta4New);
        deltaTheta4New = (sqrt((1 + cosf(delta4New)) / (1 - cosf(delta4New)))) * (1 / DBH);
        moveNode4x = (MAX(0.0, deltaTheta4New - deltaTheta4i) * (dfx4i / delta4i)) / .001147;
        moveNode4y = (MAX(0.0, deltaTheta4New - deltaTheta4i) * (dfy4i / delta4i)) / .001147;
        dfx4Total += moveNode4x;
        dfy4Total += moveNode4y;
        movement4 = [SKAction moveByX:moveNode4x y:moveNode4y duration:0.01];
        deltaTheta4i = MAX(deltaTheta4i, deltaTheta4New);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx5new = ((xOrigin5 + dfx5Total) - BHPosX) * 0.001147;
        dfy5new = ((yOrigin5 + dfy5Total) - BHPosY) * 0.001147;
        delta5New = sqrt(pow(dfx5new, 2) + pow(dfy5new, 2));
        //delta5New = MIN(.99, delta5New);
        deltaTheta5New = (sqrt((1 + cosf(delta5New)) / (1 - cosf(delta5New)))) * (1 / DBH);
        moveNode5x = (MAX(0.0, deltaTheta5New - deltaTheta5i) * (dfx5i / delta5i)) / .001147;
        moveNode5y = (MAX(0.0, deltaTheta5New - deltaTheta5i) * (dfy5i / delta5i)) / .001147;
        dfx5Total += moveNode5x;
        dfy5Total += moveNode5y;
        movement5 = [SKAction moveByX:moveNode5x y:moveNode5y duration:0.01];
        deltaTheta5i = MAX(deltaTheta5i, deltaTheta5New);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx6new = ((xOrigin6 + dfx6Total) - BHPosX) * 0.001147;
        dfy6new = ((yOrigin6 + dfy6Total) - BHPosY) * 0.001147;
        delta6New = sqrt(pow(dfx6new, 2) + pow(dfy6new, 2));
        //delta6New = MIN(.99, delta6New);
        deltaTheta6New = (sqrt((1 + cosf(delta6New)) / (1 - cosf(delta6New)))) * (1 / DBH);
        moveNode6x = (MAX(0.0, deltaTheta6New - deltaTheta6i) * (dfx6i / delta6i)) / .001147;
        moveNode6y = (MAX(0.0, deltaTheta6New - deltaTheta6i) * (dfy6i / delta6i)) / .001147;
        dfx6Total += moveNode6x;
        dfy6Total += moveNode6y;
        movement6 = [SKAction moveByX:moveNode6x y:moveNode6y duration:0.01];
        deltaTheta6i = MAX(deltaTheta6i, deltaTheta6New);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx7new = ((xOrigin7 + dfx7Total) - BHPosX) * 0.001147;
        dfy7new = ((yOrigin7 + dfy7Total) - BHPosY) * 0.001147;
        delta7New = sqrt(pow(dfx7new, 2) + pow(dfy7new, 2));
        //delta7New = MIN(.99, delta7New);
        deltaTheta7New = (sqrt((1 + cosf(delta7New)) / (1 - cosf(delta7New)))) * (1 / DBH);
        moveNode7x = (MAX(0.0, deltaTheta7New - deltaTheta7i) * (dfx7i / delta7i)) / .001147;
        moveNode7y = (MAX(0.0, deltaTheta7New - deltaTheta7i) * (dfy7i / delta7i)) / .001147;
        dfx7Total += moveNode7x;
        dfy7Total += moveNode7y;
        movement7 = [SKAction moveByX:moveNode7x y:moveNode7y duration:0.01];
        deltaTheta7i = MAX(deltaTheta7i, deltaTheta7New);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx8new = ((xOrigin8 + dfx8Total) - BHPosX) * 0.001147;
        dfy8new = ((yOrigin8 + dfy8Total) - BHPosY) * 0.001147;
        delta8New = sqrt(pow(dfx8new, 2) + pow(dfy8new, 2));
        //delta8New = MIN(.99, delta8New);
        deltaTheta8New = (sqrt((1 + cosf(delta8New)) / (1 - cosf(delta8New)))) * (1 / DBH);
        moveNode8x = (MAX(0.0, deltaTheta8New - deltaTheta8i) * (dfx8i / delta8i)) / .001147;
        moveNode8y = (MAX(0.0, deltaTheta8New - deltaTheta8i) * (dfy8i / delta8i)) / .001147;
        dfx8Total += moveNode8x;
        dfy8Total += moveNode8y;
        movement8 = [SKAction moveByX:moveNode8x y:moveNode8y duration:0.01];
        deltaTheta8i = MAX(deltaTheta8i, deltaTheta8New);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx9new = ((xOrigin9 + dfx9Total) - BHPosX) * 0.001147;
        dfy9new = ((yOrigin9 + dfy9Total) - BHPosY) * 0.001147;
        delta9New = sqrt(pow(dfx9new, 2) + pow(dfy9new, 2));
        //delta9New = MIN(.99, delta9New);
        deltaTheta9New = (sqrt((1 + cosf(delta9New)) / (1 - cosf(delta9New)))) * (1 / DBH);
        moveNode9x = (MAX(0.0, deltaTheta9New - deltaTheta9i) * (dfx9i / delta9i)) / .001147;
        moveNode9y = (MAX(0.0, deltaTheta9New - deltaTheta9i) * (dfy9i / delta9i)) / .001147;
        dfx9Total += moveNode9x;
        dfy9Total += moveNode9y;
        movement9 = [SKAction moveByX:moveNode9x y:moveNode9y duration:0.01];
        deltaTheta9i = MAX(deltaTheta9i, deltaTheta9New);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx10new = ((xOrigin10 + dfx10Total) - BHPosX) * 0.001147;
        dfy10new = ((yOrigin10 + dfy10Total) - BHPosY) * 0.001147;
        delta10New = sqrt(pow(dfx10new, 2) + pow(dfy10new, 2));
        //delta10New = MIN(.99, delta10New);
        deltaTheta10New = (sqrt((1 + cosf(delta10New)) / (1 - cosf(delta10New)))) * (1 / DBH);
        moveNode10x = (MAX(0.0, deltaTheta10New - deltaTheta10i) * (dfx10i / delta10i)) / .001147;
        moveNode10y = (MAX(0.0, deltaTheta10New - deltaTheta10i) * (dfy10i / delta10i)) / .001147;
        dfx10Total += moveNode10x;
        dfy10Total += moveNode10y;
        movement10 = [SKAction moveByX:moveNode10x y:moveNode10y duration:0.01];
        deltaTheta10i = MAX(deltaTheta10i, deltaTheta10New);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx11new = ((xOrigin11 + dfx11Total) - BHPosX) * 0.001147;
        dfy11new = ((yOrigin11 + dfy11Total) - BHPosY) * 0.001147;
        delta11New = sqrt(pow(dfx11new, 2) + pow(dfy11new, 2));
        //delta11New = MIN(.99, delta11New);
        deltaTheta11New = (sqrt((1 + cosf(delta11New)) / (1 - cosf(delta11New)))) * (1 / DBH);
        moveNode11x = (MAX(0.0, deltaTheta11New - deltaTheta11i) * (dfx11i / delta11i)) / .001147;
        moveNode11y = (MAX(0.0, deltaTheta11New - deltaTheta11i) * (dfy11i / delta11i)) / .001147;
        dfx11Total += moveNode11x;
        dfy11Total += moveNode11y;
        movement11 = [SKAction moveByX:moveNode11x y:moveNode11y duration:0.01];
        deltaTheta11i = MAX(deltaTheta11i, deltaTheta11New);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx12new = ((xOrigin12 + dfx12Total) - BHPosX) * 0.001147;
        dfy12new = ((yOrigin12 + dfy12Total) - BHPosY) * 0.001147;
        delta12New = sqrt(pow(dfx12new, 2) + pow(dfy12new, 2));
        //delta12New = MIN(.99, delta12New);
        deltaTheta12New = (sqrt((1 + cosf(delta12New)) / (1 - cosf(delta12New)))) * (1 / DBH);
        moveNode12x = (MAX(0.0, deltaTheta12New - deltaTheta12i) * (dfx12i / delta12i)) / .001147;
        moveNode12y = (MAX(0.0, deltaTheta12New - deltaTheta12i) * (dfy12i / delta12i)) / .001147;
        dfx12Total += moveNode12x;
        dfy12Total += moveNode12y;
        movement12 = [SKAction moveByX:moveNode12x y:moveNode12y duration:0.01];
        deltaTheta12i = MAX(deltaTheta12i, deltaTheta12New);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx13new = ((xOrigin13 + dfx13Total) - BHPosX) * 0.001147;
        dfy13new = ((yOrigin13 + dfy13Total) - BHPosY) * 0.001147;
        delta13New = sqrt(pow(dfx13new, 2) + pow(dfy13new, 2));
        //delta13New = MIN(.99, delta13New);
        deltaTheta13New = (sqrt((1 + cosf(delta13New)) / (1 - cosf(delta13New)))) * (1 / DBH);
        moveNode13x = (MAX(0.0, deltaTheta13New - deltaTheta13i) * (dfx13i / delta13i)) / .001147;
        moveNode13y = (MAX(0.0, deltaTheta13New - deltaTheta13i) * (dfy13i / delta13i)) / .001147;
        dfx13Total += moveNode13x;
        dfy13Total += moveNode13y;
        movement13 = [SKAction moveByX:moveNode13x y:moveNode13y duration:0.01];
        deltaTheta13i = MAX(deltaTheta13i, deltaTheta13New);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx14new = ((xOrigin14 + dfx14Total) - BHPosX) * 0.001147;
        dfy14new = ((yOrigin14 + dfy14Total) - BHPosY) * 0.001147;
        delta14New = sqrt(pow(dfx14new, 2) + pow(dfy14new, 2));
        //delta14New = MIN(.99, delta14New);
        deltaTheta14New = (sqrt((1 + cosf(delta14New)) / (1 - cosf(delta14New)))) * (1 / DBH);
        moveNode14x = (MAX(0.0, deltaTheta14New - deltaTheta14i) * (dfx14i / delta14i)) / .001147;
        moveNode14y = (MAX(0.0, deltaTheta14New - deltaTheta14i) * (dfy14i / delta14i)) / .001147;
        dfx14Total += moveNode14x;
        dfy14Total += moveNode14y;
        movement14 = [SKAction moveByX:moveNode14x y:moveNode14y duration:0.01];
        deltaTheta14i = MAX(deltaTheta14i, deltaTheta14New);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx15new = ((xOrigin15 + dfx15Total) - BHPosX) * 0.001147;
        dfy15new = ((yOrigin15 + dfy15Total) - BHPosY) * 0.001147;
        delta15New = sqrt(pow(dfx15new, 2) + pow(dfy15new, 2));
        //delta15New = MIN(.99, delta15New);
        deltaTheta15New = (sqrt((1 + cosf(delta15New)) / (1 - cosf(delta15New)))) * (1 / DBH);
        moveNode15x = (MAX(0.0, deltaTheta15New - deltaTheta15i) * (dfx15i / delta15i)) / .001147;
        moveNode15y = (MAX(0.0, deltaTheta15New - deltaTheta15i) * (dfy15i / delta15i)) / .001147;
        dfx15Total += moveNode15x;
        dfy15Total += moveNode15y;
        movement15 = [SKAction moveByX:moveNode15x y:moveNode15y duration:0.01];
        deltaTheta15i = MAX(deltaTheta15i, deltaTheta15New);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx16new = ((xOrigin16 + dfx16Total) - BHPosX) * 0.001147;
        dfy16new = ((yOrigin16 + dfy16Total) - BHPosY) * 0.001147;
        delta16New = sqrt(pow(dfx16new, 2) + pow(dfy16new, 2));
        //delta16New = MIN(.99, delta16New);
        deltaTheta16New = (sqrt((1 + cosf(delta16New)) / (1 - cosf(delta16New)))) * (1 / DBH);
        moveNode16x = (MAX(0.0, deltaTheta16New - deltaTheta16i) * (dfx16i / delta16i)) / .001147;
        moveNode16y = (MAX(0.0, deltaTheta16New - deltaTheta16i) * (dfy16i / delta16i)) / .001147;
        dfx16Total += moveNode16x;
        dfy16Total += moveNode16y;
        movement16 = [SKAction moveByX:moveNode16x y:moveNode16y duration:0.01];
        deltaTheta16i = MAX(deltaTheta16i, deltaTheta16New);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx17new = ((xOrigin17 + dfx17Total) - BHPosX) * 0.001147;
        dfy17new = ((yOrigin17 + dfy17Total) - BHPosY) * 0.001147;
        delta17New = sqrt(pow(dfx17new, 2) + pow(dfy17new, 2));
        //delta17New = MIN(.99, delta17New);
        deltaTheta17New = (sqrt((1 + cosf(delta17New)) / (1 - cosf(delta17New)))) * (1 / DBH);
        moveNode17x = (MAX(0.0, deltaTheta17New - deltaTheta17i) * (dfx17i / delta17i)) / .001147;
        moveNode17y = (MAX(0.0, deltaTheta17New - deltaTheta17i) * (dfy17i / delta17i)) / .001147;
        dfx17Total += moveNode17x;
        dfy17Total += moveNode17y;
        movement17 = [SKAction moveByX:moveNode17x y:moveNode17y duration:0.01];
        deltaTheta17i = MAX(deltaTheta17i, deltaTheta17New);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx18new = ((xOrigin18 + dfx18Total) - BHPosX) * 0.001147;
        dfy18new = ((yOrigin18 + dfy18Total) - BHPosY) * 0.001147;
        delta18New = sqrt(pow(dfx18new, 2) + pow(dfy18new, 2));
        //delta18New = MIN(.99, delta18New);
        deltaTheta18New = (sqrt((1 + cosf(delta18New)) / (1 - cosf(delta18New)))) * (1 / DBH);
        moveNode18x = (MAX(0.0, deltaTheta18New - deltaTheta18i) * (dfx18i / delta18i)) / .001147;
        moveNode18y = (MAX(0.0, deltaTheta18New - deltaTheta18i) * (dfy18i / delta18i)) / .001147;
        dfx18Total += moveNode18x;
        dfy18Total += moveNode18y;
        movement18 = [SKAction moveByX:moveNode18x y:moveNode18y duration:0.01];
        deltaTheta18i = MAX(deltaTheta18i, deltaTheta18New);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx19new = ((xOrigin19 + dfx19Total) - BHPosX) * 0.001147;
        dfy19new = ((yOrigin19 + dfy19Total) - BHPosY) * 0.001147;
        delta19New = sqrt(pow(dfx19new, 2) + pow(dfy19new, 2));
        //delta19New = MIN(.99, delta19New);
        deltaTheta19New = (sqrt((1 + cosf(delta19New)) / (1 - cosf(delta19New)))) * (1 / DBH);
        moveNode19x = (MAX(0.0, deltaTheta19New - deltaTheta19i) * (dfx19i / delta19i)) / .001147;
        moveNode19y = (MAX(0.0, deltaTheta19New - deltaTheta19i) * (dfy19i / delta19i)) / .001147;
        dfx19Total += moveNode19x;
        dfy19Total += moveNode19y;
        movement19 = [SKAction moveByX:moveNode19x y:moveNode19y duration:0.01];
        deltaTheta19i = MAX(deltaTheta19i, deltaTheta19New);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx20new = ((xOrigin20 + dfx20Total) - BHPosX) * 0.001147;
        dfy20new = ((yOrigin20 + dfy20Total) - BHPosY) * 0.001147;
        delta20New = sqrt(pow(dfx20new, 2) + pow(dfy20new, 2));
        //delta20New = MIN(.99, delta20New);
        deltaTheta20New = (sqrt((1 + cosf(delta20New)) / (1 - cosf(delta20New)))) * (1 / DBH);
        moveNode20x = (MAX(0.0, deltaTheta20New - deltaTheta20i) * (dfx20i / delta20i)) / .001147;
        moveNode20y = (MAX(0.0, deltaTheta20New - deltaTheta20i) * (dfy20i / delta20i)) / .001147;
        dfx20Total += moveNode20x;
        dfy20Total += moveNode20y;
        movement20 = [SKAction moveByX:moveNode20x y:moveNode20y duration:0.01];
        deltaTheta20i = MAX(deltaTheta20i, deltaTheta20New);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx21new = ((xOrigin21 + dfx21Total) - BHPosX) * 0.001147;
        dfy21new = ((yOrigin21 + dfy21Total) - BHPosY) * 0.001147;
        delta21New = sqrt(pow(dfx21new, 2) + pow(dfy21new, 2));
        //delta21New = MIN(.99, delta21New);
        deltaTheta21New = (sqrt((1 + cosf(delta21New)) / (1 - cosf(delta21New)))) * (1 / DBH);
        moveNode21x = (MAX(0.0, deltaTheta21New - deltaTheta21i) * (dfx21i / delta21i)) / .001147;
        moveNode21y = (MAX(0.0, deltaTheta21New - deltaTheta21i) * (dfy21i / delta21i)) / .001147;
        dfx21Total += moveNode21x;
        dfy21Total += moveNode21y;
        movement21 = [SKAction moveByX:moveNode21x y:moveNode21y duration:0.01];
        deltaTheta21i = MAX(deltaTheta21i, deltaTheta21New);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx22new = ((xOrigin22 + dfx22Total) - BHPosX) * 0.001147;
        dfy22new = ((yOrigin22 + dfy22Total) - BHPosY) * 0.001147;
        delta22New = sqrt(pow(dfx22new, 2) + pow(dfy22new, 2));
        //delta22New = MIN(.99, delta22New);
        deltaTheta22New = (sqrt((1 + cosf(delta22New)) / (1 - cosf(delta22New)))) * (1 / DBH);
        moveNode22x = (MAX(0.0, deltaTheta22New - deltaTheta22i) * (dfx22i / delta22i)) / .001147;
        moveNode22y = (MAX(0.0, deltaTheta22New - deltaTheta22i) * (dfy22i / delta22i)) / .001147;
        dfx22Total += moveNode22x;
        dfy22Total += moveNode22y;
        movement22 = [SKAction moveByX:moveNode22x y:moveNode22y duration:0.01];
        deltaTheta22i = MAX(deltaTheta22i, deltaTheta22New);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx23new = ((xOrigin23 + dfx23Total) - BHPosX) * 0.001147;
        dfy23new = ((yOrigin23 + dfy23Total) - BHPosY) * 0.001147;
        delta23New = sqrt(pow(dfx23new, 2) + pow(dfy23new, 2));
        //delta23New = MIN(.99, delta23New);
        deltaTheta23New = (sqrt((1 + cosf(delta23New)) / (1 - cosf(delta23New)))) * (1 / DBH);
        moveNode23x = (MAX(0.0, deltaTheta23New - deltaTheta23i) * (dfx23i / delta23i)) / .001147;
        moveNode23y = (MAX(0.0, deltaTheta23New - deltaTheta23i) * (dfy23i / delta23i)) / .001147;
        dfx23Total += moveNode23x;
        dfy23Total += moveNode23y;
        movement23 = [SKAction moveByX:moveNode23x y:moveNode23y duration:0.01];
        deltaTheta23i = MAX(deltaTheta23i, deltaTheta23New);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx24new = ((xOrigin24 + dfx24Total) - BHPosX) * 0.001147;
        dfy24new = ((yOrigin24 + dfy24Total) - BHPosY) * 0.001147;
        delta24New = sqrt(pow(dfx24new, 2) + pow(dfy24new, 2));
        //delta24New = MIN(.99, delta24New);
        deltaTheta24New = (sqrt((1 + cosf(delta24New)) / (1 - cosf(delta24New)))) * (1 / DBH);
        moveNode24x = (MAX(0.0, deltaTheta24New - deltaTheta24i) * (dfx24i / delta24i)) / .001147;
        moveNode24y = (MAX(0.0, deltaTheta24New - deltaTheta24i) * (dfy24i / delta24i)) / .001147;
        dfx24Total += moveNode24x;
        dfy24Total += moveNode24y;
        movement24 = [SKAction moveByX:moveNode24x y:moveNode24y duration:0.01];
        deltaTheta24i = MAX(deltaTheta24i, deltaTheta24New);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx25new = ((xOrigin25 + dfx25Total) - BHPosX) * 0.001147;
        dfy25new = ((yOrigin25 + dfy25Total) - BHPosY) * 0.001147;
        delta25New = sqrt(pow(dfx25new, 2) + pow(dfy25new, 2));
        //delta25New = MIN(.99, delta25New);
        deltaTheta25New = (sqrt((1 + cosf(delta25New)) / (1 - cosf(delta25New)))) * (1 / DBH);
        moveNode25x = (MAX(0.0, deltaTheta25New - deltaTheta25i) * (dfx25i / delta25i)) / .001147;
        moveNode25y = (MAX(0.0, deltaTheta25New - deltaTheta25i) * (dfy25i / delta25i)) / .001147;
        dfx25Total += moveNode25x;
        dfy25Total += moveNode25y;
        movement25 = [SKAction moveByX:moveNode25x y:moveNode25y duration:0.01];
        deltaTheta25i = MAX(deltaTheta25i, deltaTheta25New);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx26new = ((xOrigin26 + dfx26Total) - BHPosX) * 0.001147;
        dfy26new = ((yOrigin26 + dfy26Total) - BHPosY) * 0.001147;
        delta26New = sqrt(pow(dfx26new, 2) + pow(dfy26new, 2));
        //delta26New = MIN(.99, delta26New);
        deltaTheta26New = (sqrt((1 + cosf(delta26New)) / (1 - cosf(delta26New)))) * (1 / DBH);
        moveNode26x = (MAX(0.0, deltaTheta26New - deltaTheta26i) * (dfx26i / delta26i)) / .001147;
        moveNode26y = (MAX(0.0, deltaTheta26New - deltaTheta26i) * (dfy26i / delta26i)) / .001147;
        dfx26Total += moveNode26x;
        dfy26Total += moveNode26y;
        movement26 = [SKAction moveByX:moveNode26x y:moveNode26y duration:0.01];
        deltaTheta26i = MAX(deltaTheta26i, deltaTheta26New);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx27new = ((xOrigin27 + dfx27Total) - BHPosX) * 0.001147;
        dfy27new = ((yOrigin27 + dfy27Total) - BHPosY) * 0.001147;
        delta27New = sqrt(pow(dfx27new, 2) + pow(dfy27new, 2));
        //delta27New = MIN(.99, delta27New);
        deltaTheta27New = (sqrt((1 + cosf(delta27New)) / (1 - cosf(delta27New)))) * (1 / DBH);
        moveNode27x = (MAX(0.0, deltaTheta27New - deltaTheta27i) * (dfx27i / delta27i)) / .001147;
        moveNode27y = (MAX(0.0, deltaTheta27New - deltaTheta27i) * (dfy27i / delta27i)) / .001147;
        dfx27Total += moveNode27x;
        dfy27Total += moveNode27y;
        movement27 = [SKAction moveByX:moveNode27x y:moveNode27y duration:0.01];
        deltaTheta27i = MAX(deltaTheta27i, deltaTheta27New);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx28new = ((xOrigin28 + dfx28Total) - BHPosX) * 0.001147;
        dfy28new = ((yOrigin28 + dfy28Total) - BHPosY) * 0.001147;
        delta28New = sqrt(pow(dfx28new, 2) + pow(dfy28new, 2));
        //delta28New = MIN(.99, delta28New);
        deltaTheta28New = (sqrt((1 + cosf(delta28New)) / (1 - cosf(delta28New)))) * (1 / DBH);
        moveNode28x = (MAX(0.0, deltaTheta28New - deltaTheta28i) * (dfx28i / delta28i)) / .001147;
        moveNode28y = (MAX(0.0, deltaTheta28New - deltaTheta28i) * (dfy28i / delta28i)) / .001147;
        dfx28Total += moveNode28x;
        dfy28Total += moveNode28y;
        movement28 = [SKAction moveByX:moveNode28x y:moveNode28y duration:0.01];
        deltaTheta28i = MAX(deltaTheta28i, deltaTheta28New);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx29new = ((xOrigin29 + dfx29Total) - BHPosX) * 0.001147;
        dfy29new = ((yOrigin29 + dfy29Total) - BHPosY) * 0.001147;
        delta29New = sqrt(pow(dfx29new, 2) + pow(dfy29new, 2));
        //delta29New = MIN(.99, delta29New);
        deltaTheta29New = (sqrt((1 + cosf(delta29New)) / (1 - cosf(delta29New)))) * (1 / DBH);
        moveNode29x = (MAX(0.0, deltaTheta29New - deltaTheta29i) * (dfx29i / delta29i)) / .001147;
        moveNode29y = (MAX(0.0, deltaTheta29New - deltaTheta29i) * (dfy29i / delta29i)) / .001147;
        dfx29Total += moveNode29x;
        dfy29Total += moveNode29y;
        movement29 = [SKAction moveByX:moveNode29x y:moveNode29y duration:0.01];
        deltaTheta29i = MAX(deltaTheta29i, deltaTheta29New);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx30new = ((xOrigin30 + dfx30Total) - BHPosX) * 0.001147;
        dfy30new = ((yOrigin30 + dfy30Total) - BHPosY) * 0.001147;
        delta30New = sqrt(pow(dfx30new, 2) + pow(dfy30new, 2));
        //delta30New = MIN(.99, delta30New);
        deltaTheta30New = (sqrt((1 + cosf(delta30New)) / (1 - cosf(delta30New)))) * (1 / DBH);
        moveNode30x = (MAX(0.0, deltaTheta30New - deltaTheta30i) * (dfx30i / delta30i)) / .001147;
        moveNode30y = (MAX(0.0, deltaTheta30New - deltaTheta30i) * (dfy30i / delta30i)) / .001147;
        dfx30Total += moveNode30x;
        dfy30Total += moveNode30y;
        movement30 = [SKAction moveByX:moveNode30x y:moveNode30y duration:0.01];
        deltaTheta30i = MAX(deltaTheta30i, deltaTheta30New);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx31new = ((xOrigin31 + dfx31Total) - BHPosX) * 0.001147;
        dfy31new = ((yOrigin31 + dfy31Total) - BHPosY) * 0.001147;
        delta31New = sqrt(pow(dfx31new, 2) + pow(dfy31new, 2));
        //delta31New = MIN(.99, delta31New);
        deltaTheta31New = (sqrt((1 + cosf(delta31New)) / (1 - cosf(delta31New)))) * (1 / DBH);
        moveNode31x = (MAX(0.0, deltaTheta31New - deltaTheta31i) * (dfx31i / delta31i)) / .001147;
        moveNode31y = (MAX(0.0, deltaTheta31New - deltaTheta31i) * (dfy31i / delta31i)) / .001147;
        dfx31Total += moveNode31x;
        dfy31Total += moveNode31y;
        movement31 = [SKAction moveByX:moveNode31x y:moveNode31y duration:0.01];
        deltaTheta31i = MAX(deltaTheta31i, deltaTheta31New);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx32new = ((xOrigin32 + dfx32Total) - BHPosX) * 0.001147;
        dfy32new = ((yOrigin32 + dfy32Total) - BHPosY) * 0.001147;
        delta32New = sqrt(pow(dfx32new, 2) + pow(dfy32new, 2));
        //delta32New = MIN(.99, delta32New);
        deltaTheta32New = (sqrt((1 + cosf(delta32New)) / (1 - cosf(delta32New)))) * (1 / DBH);
        moveNode32x = (MAX(0.0, deltaTheta32New - deltaTheta32i) * (dfx32i / delta32i)) / .001147;
        moveNode32y = (MAX(0.0, deltaTheta32New - deltaTheta32i) * (dfy32i / delta32i)) / .001147;
        dfx32Total += moveNode32x;
        dfy32Total += moveNode32y;
        movement32 = [SKAction moveByX:moveNode32x y:moveNode32y duration:0.01];
        deltaTheta32i = MAX(deltaTheta32i, deltaTheta32New);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx33new = ((xOrigin33 + dfx33Total) - BHPosX) * 0.001147;
        dfy33new = ((yOrigin33 + dfy33Total) - BHPosY) * 0.001147;
        delta33New = sqrt(pow(dfx33new, 2) + pow(dfy33new, 2));
        //delta33New = MIN(.99, delta33New);
        deltaTheta33New = (sqrt((1 + cosf(delta33New)) / (1 - cosf(delta33New)))) * (1 / DBH);
        moveNode33x = (MAX(0.0, deltaTheta33New - deltaTheta33i) * (dfx33i / delta33i)) / .001147;
        moveNode33y = (MAX(0.0, deltaTheta33New - deltaTheta33i) * (dfy33i / delta33i)) / .001147;
        dfx33Total += moveNode33x;
        dfy33Total += moveNode33y;
        movement33 = [SKAction moveByX:moveNode33x y:moveNode33y duration:0.01];
        deltaTheta33i = MAX(deltaTheta33i, deltaTheta33New);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx34new = ((xOrigin34 + dfx34Total) - BHPosX) * 0.001147;
        dfy34new = ((yOrigin34 + dfy34Total) - BHPosY) * 0.001147;
        delta34New = sqrt(pow(dfx34new, 2) + pow(dfy34new, 2));
        //delta34New = MIN(.99, delta34New);
        deltaTheta34New = (sqrt((1 + cosf(delta34New)) / (1 - cosf(delta34New)))) * (1 / DBH);
        moveNode34x = (MAX(0.0, deltaTheta34New - deltaTheta34i) * (dfx34i / delta34i)) / .001147;
        moveNode34y = (MAX(0.0, deltaTheta34New - deltaTheta34i) * (dfy34i / delta34i)) / .001147;
        dfx34Total += moveNode34x;
        dfy34Total += moveNode34y;
        movement34 = [SKAction moveByX:moveNode34x y:moveNode34y duration:0.01];
        deltaTheta34i = MAX(deltaTheta34i, deltaTheta34New);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx35new = ((xOrigin35 + dfx35Total) - BHPosX) * 0.001147;
        dfy35new = ((yOrigin35 + dfy35Total) - BHPosY) * 0.001147;
        delta35New = sqrt(pow(dfx35new, 2) + pow(dfy35new, 2));
        //delta35New = MIN(.99, delta35New);
        deltaTheta35New = (sqrt((1 + cosf(delta35New)) / (1 - cosf(delta35New)))) * (1 / DBH);
        moveNode35x = (MAX(0.0, deltaTheta35New - deltaTheta35i) * (dfx35i / delta35i)) / .001147;
        moveNode35y = (MAX(0.0, deltaTheta35New - deltaTheta35i) * (dfy35i / delta35i)) / .001147;
        dfx35Total += moveNode35x;
        dfy35Total += moveNode35y;
        movement35 = [SKAction moveByX:moveNode35x y:moveNode35y duration:0.01];
        deltaTheta35i = MAX(deltaTheta35i, deltaTheta35New);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx36new = ((xOrigin36 + dfx36Total) - BHPosX) * 0.001147;
        dfy36new = ((yOrigin36 + dfy36Total) - BHPosY) * 0.001147;
        delta36New = sqrt(pow(dfx36new, 2) + pow(dfy36new, 2));
        //delta36New = MIN(.99, delta36New);
        deltaTheta36New = (sqrt((1 + cosf(delta36New)) / (1 - cosf(delta36New)))) * (1 / DBH);
        moveNode36x = (MAX(0.0, deltaTheta36New - deltaTheta36i) * (dfx36i / delta36i)) / .001147;
        moveNode36y = (MAX(0.0, deltaTheta36New - deltaTheta36i) * (dfy36i / delta36i)) / .001147;
        dfx36Total += moveNode36x;
        dfy36Total += moveNode36y;
        movement36 = [SKAction moveByX:moveNode36x y:moveNode36y duration:0.01];
        deltaTheta36i = MAX(deltaTheta36i, deltaTheta36New);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx37new = ((xOrigin37 + dfx37Total) - BHPosX) * 0.001147;
        dfy37new = ((yOrigin37 + dfy37Total) - BHPosY) * 0.001147;
        delta37New = sqrt(pow(dfx37new, 2) + pow(dfy37new, 2));
        //delta37New = MIN(.99, delta37New);
        deltaTheta37New = (sqrt((1 + cosf(delta37New)) / (1 - cosf(delta37New)))) * (1 / DBH);
        moveNode37x = (MAX(0.0, deltaTheta37New - deltaTheta37i) * (dfx37i / delta37i)) / .001147;
        moveNode37y = (MAX(0.0, deltaTheta37New - deltaTheta37i) * (dfy37i / delta37i)) / .001147;
        dfx37Total += moveNode37x;
        dfy37Total += moveNode37y;
        movement37 = [SKAction moveByX:moveNode37x y:moveNode37y duration:0.01];
        deltaTheta37i = MAX(deltaTheta37i, deltaTheta37New);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx38new = ((xOrigin38 + dfx38Total) - BHPosX) * 0.001147;
        dfy38new = ((yOrigin38 + dfy38Total) - BHPosY) * 0.001147;
        delta38New = sqrt(pow(dfx38new, 2) + pow(dfy38new, 2));
        //delta38New = MIN(.99, delta38New);
        deltaTheta38New = (sqrt((1 + cosf(delta38New)) / (1 - cosf(delta38New)))) * (1 / DBH);
        moveNode38x = (MAX(0.0, deltaTheta38New - deltaTheta38i) * (dfx38i / delta38i)) / .001147;
        moveNode38y = (MAX(0.0, deltaTheta38New - deltaTheta38i) * (dfy38i / delta38i)) / .001147;
        dfx38Total += moveNode38x;
        dfy38Total += moveNode38y;
        movement38 = [SKAction moveByX:moveNode38x y:moveNode38y duration:0.01];
        deltaTheta38i = MAX(deltaTheta38i, deltaTheta38New);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx39new = ((xOrigin39 + dfx39Total) - BHPosX) * 0.001147;
        dfy39new = ((yOrigin39 + dfy39Total) - BHPosY) * 0.001147;
        delta39New = sqrt(pow(dfx39new, 2) + pow(dfy39new, 2));
        //delta39New = MIN(.99, delta39New);
        deltaTheta39New = (sqrt((1 + cosf(delta39New)) / (1 - cosf(delta39New)))) * (1 / DBH);
        moveNode39x = (MAX(0.0, deltaTheta39New - deltaTheta39i) * (dfx39i / delta39i)) / .001147;
        moveNode39y = (MAX(0.0, deltaTheta39New - deltaTheta39i) * (dfy39i / delta39i)) / .001147;
        dfx39Total += moveNode39x;
        dfy39Total += moveNode39y;
        movement39 = [SKAction moveByX:moveNode39x y:moveNode39y duration:0.01];
        deltaTheta39i = MAX(deltaTheta39i, deltaTheta39New);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx40new = ((xOrigin40 + dfx40Total) - BHPosX) * 0.001147;
        dfy40new = ((yOrigin40 + dfy40Total) - BHPosY) * 0.001147;
        delta40New = sqrt(pow(dfx40new, 2) + pow(dfy40new, 2));
        //delta40New = MIN(.99, delta40New);
        deltaTheta40New = (sqrt((1 + cosf(delta40New)) / (1 - cosf(delta40New)))) * (1 / DBH);
        moveNode40x = (MAX(0.0, deltaTheta40New - deltaTheta40i) * (dfx40i / delta40i)) / .001147;
        moveNode40y = (MAX(0.0, deltaTheta40New - deltaTheta40i) * (dfy40i / delta40i)) / .001147;
        dfx40Total += moveNode40x;
        dfy40Total += moveNode40y;
        movement40 = [SKAction moveByX:moveNode40x y:moveNode40y duration:0.01];
        deltaTheta40i = MAX(deltaTheta40i, deltaTheta40New);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx41new = ((xOrigin41 + dfx41Total) - BHPosX) * 0.001147;
        dfy41new = ((yOrigin41 + dfy41Total) - BHPosY) * 0.001147;
        delta41New = sqrt(pow(dfx41new, 2) + pow(dfy41new, 2));
        //delta41New = MIN(.99, delta41New);
        deltaTheta41New = (sqrt((1 + cosf(delta41New)) / (1 - cosf(delta41New)))) * (1 / DBH);
        moveNode41x = (MAX(0.0, deltaTheta41New - deltaTheta41i) * (dfx41i / delta41i)) / .001147;
        moveNode41y = (MAX(0.0, deltaTheta41New - deltaTheta41i) * (dfy41i / delta41i)) / .001147;
        dfx41Total += moveNode41x;
        dfy41Total += moveNode41y;
        movement41 = [SKAction moveByX:moveNode41x y:moveNode41y duration:0.01];
        deltaTheta41i = MAX(deltaTheta41i, deltaTheta41New);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx42new = ((xOrigin42 + dfx42Total) - BHPosX) * 0.001147;
        dfy42new = ((yOrigin42 + dfy42Total) - BHPosY) * 0.001147;
        delta42New = sqrt(pow(dfx42new, 2) + pow(dfy42new, 2));
        //delta42New = MIN(.99, delta42New);
        deltaTheta42New = (sqrt((1 + cosf(delta42New)) / (1 - cosf(delta42New)))) * (1 / DBH);
        moveNode42x = (MAX(0.0, deltaTheta42New - deltaTheta42i) * (dfx42i / delta42i)) / .001147;
        moveNode42y = (MAX(0.0, deltaTheta42New - deltaTheta42i) * (dfy42i / delta42i)) / .001147;
        dfx42Total += moveNode42x;
        dfy42Total += moveNode42y;
        movement42 = [SKAction moveByX:moveNode42x y:moveNode42y duration:0.01];
        deltaTheta42i = MAX(deltaTheta42i, deltaTheta42New);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx43new = ((xOrigin43 + dfx43Total) - BHPosX) * 0.001147;
        dfy43new = ((yOrigin43 + dfy43Total) - BHPosY) * 0.001147;
        delta43New = sqrt(pow(dfx43new, 2) + pow(dfy43new, 2));
        //delta43New = MIN(.99, delta43New);
        deltaTheta43New = (sqrt((1 + cosf(delta43New)) / (1 - cosf(delta43New)))) * (1 / DBH);
        moveNode43x = (MAX(0.0, deltaTheta43New - deltaTheta43i) * (dfx43i / delta43i)) / .001147;
        moveNode43y = (MAX(0.0, deltaTheta43New - deltaTheta43i) * (dfy43i / delta43i)) / .001147;
        dfx43Total += moveNode43x;
        dfy43Total += moveNode43y;
        movement43 = [SKAction moveByX:moveNode43x y:moveNode43y duration:0.01];
        deltaTheta43i = MAX(deltaTheta43i, deltaTheta43New);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx44new = ((xOrigin44 + dfx44Total) - BHPosX) * 0.001147;
        dfy44new = ((yOrigin44 + dfy44Total) - BHPosY) * 0.001147;
        delta44New = sqrt(pow(dfx44new, 2) + pow(dfy44new, 2));
        //delta44New = MIN(.99, delta44New);
        deltaTheta44New = (sqrt((1 + cosf(delta44New)) / (1 - cosf(delta44New)))) * (1 / DBH);
        moveNode44x = (MAX(0.0, deltaTheta44New - deltaTheta44i) * (dfx44i / delta44i)) / .001147;
        moveNode44y = (MAX(0.0, deltaTheta44New - deltaTheta44i) * (dfy44i / delta44i)) / .001147;
        dfx44Total += moveNode44x;
        dfy44Total += moveNode44y;
        movement44 = [SKAction moveByX:moveNode44x y:moveNode44y duration:0.01];
        deltaTheta44i = MAX(deltaTheta44i, deltaTheta44New);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx45new = ((xOrigin45 + dfx45Total) - BHPosX) * 0.001147;
        dfy45new = ((yOrigin45 + dfy45Total) - BHPosY) * 0.001147;
        delta45New = sqrt(pow(dfx45new, 2) + pow(dfy45new, 2));
        //delta45New = MIN(.99, delta45New);
        deltaTheta45New = (sqrt((1 + cosf(delta45New)) / (1 - cosf(delta45New)))) * (1 / DBH);
        moveNode45x = (MAX(0.0, deltaTheta45New - deltaTheta45i) * (dfx45i / delta45i)) / .001147;
        moveNode45y = (MAX(0.0, deltaTheta45New - deltaTheta45i) * (dfy45i / delta45i)) / .001147;
        dfx45Total += moveNode45x;
        dfy45Total += moveNode45y;
        movement45 = [SKAction moveByX:moveNode45x y:moveNode45y duration:0.01];
        deltaTheta45i = MAX(deltaTheta45i, deltaTheta45New);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx46new = ((xOrigin46 + dfx46Total) - BHPosX) * 0.001147;
        dfy46new = ((yOrigin46 + dfy46Total) - BHPosY) * 0.001147;
        delta46New = sqrt(pow(dfx46new, 2) + pow(dfy46new, 2));
        //delta46New = MIN(.99, delta46New);
        deltaTheta46New = (sqrt((1 + cosf(delta46New)) / (1 - cosf(delta46New)))) * (1 / DBH);
        moveNode46x = (MAX(0.0, deltaTheta46New - deltaTheta46i) * (dfx46i / delta46i)) / .001147;
        moveNode46y = (MAX(0.0, deltaTheta46New - deltaTheta46i) * (dfy46i / delta46i)) / .001147;
        dfx46Total += moveNode46x;
        dfy46Total += moveNode46y;
        movement46 = [SKAction moveByX:moveNode46x y:moveNode46y duration:0.01];
        deltaTheta46i = MAX(deltaTheta46i, deltaTheta46New);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx47new = ((xOrigin47 + dfx47Total) - BHPosX) * 0.001147;
        dfy47new = ((yOrigin47 + dfy47Total) - BHPosY) * 0.001147;
        delta47New = sqrt(pow(dfx47new, 2) + pow(dfy47new, 2));
        //delta47New = MIN(.99, delta47New);
        deltaTheta47New = (sqrt((1 + cosf(delta47New)) / (1 - cosf(delta47New)))) * (1 / DBH);
        moveNode47x = (MAX(0.0, deltaTheta47New - deltaTheta47i) * (dfx47i / delta47i)) / .001147;
        moveNode47y = (MAX(0.0, deltaTheta47New - deltaTheta47i) * (dfy47i / delta47i)) / .001147;
        dfx47Total += moveNode47x;
        dfy47Total += moveNode47y;
        movement47 = [SKAction moveByX:moveNode47x y:moveNode47y duration:0.01];
        deltaTheta47i = MAX(deltaTheta47i, deltaTheta47New);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //Ambient stars
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx1newa = ((xOrigin1a + dfx1Totala) - BHPosX) * 0.001147;
        dfy1newa = ((yOrigin1a + dfy1Totala) - BHPosY) * 0.001147;
        delta1Newa = sqrt(pow(dfx1newa, 2) + pow(dfy1newa, 2));
        //delta1Newa = MIN(.99, delta1Newa);
        deltaTheta1Newa = (sqrt((1 + cosf(delta1Newa)) / (1 - cosf(delta1Newa)))) * (1 / DBH);
        moveNode1xa = (MAX(0.0, deltaTheta1Newa - deltaTheta1ia) * (dfx1ia / delta1ia)) / .001147;
        moveNode1ya = (MAX(0.0, deltaTheta1Newa - deltaTheta1ia) * (dfy1ia / delta1ia)) / .001147;
        dfx1Totala += moveNode1xa;
        dfy1Totala += moveNode1ya;
        movement1a = [SKAction moveByX:moveNode1xa y:moveNode1ya duration:0.01];
        deltaTheta1ia = MAX(deltaTheta1ia, deltaTheta1Newa);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx2newa = ((xOrigin2a + dfx2Totala) - BHPosX) * 0.001147;
        dfy2newa = ((yOrigin2a + dfy2Totala) - BHPosY) * 0.001147;
        delta2Newa = sqrt(pow(dfx2newa, 2) + pow(dfy2newa, 2));
        //delta2Newa = MIN(.99, delta2Newa);
        deltaTheta2Newa = (sqrt((1 + cosf(delta2Newa)) / (1 - cosf(delta2Newa)))) * (1 / DBH);
        moveNode2xa = (MAX(0.0, deltaTheta2Newa - deltaTheta2ia) * (dfx2ia / delta2ia)) / .001147;
        moveNode2ya = (MAX(0.0, deltaTheta2Newa - deltaTheta2ia) * (dfy2ia / delta2ia)) / .001147;
        dfx2Totala += moveNode2xa;
        dfy2Totala += moveNode2ya;
        movement2a = [SKAction moveByX:moveNode2xa y:moveNode2ya duration:0.01];
        deltaTheta2ia = MAX(deltaTheta2ia, deltaTheta2Newa);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx3newa = ((xOrigin3a + dfx3Totala) - BHPosX) * 0.001147;
        dfy3newa = ((yOrigin3a + dfy3Totala) - BHPosY) * 0.001147;
        delta3Newa = sqrt(pow(dfx3newa, 2) + pow(dfy3newa, 2));
        //delta3Newa = MIN(.99, delta3New);
        deltaTheta3Newa = (sqrt((1 + cosf(delta3Newa)) / (1 - cosf(delta3Newa)))) * (1 / DBH);
        moveNode3xa = (MAX(0.0, deltaTheta3Newa - deltaTheta3ia) * (dfx3ia / delta3ia)) / .001147;
        moveNode3ya = (MAX(0.0, deltaTheta3Newa - deltaTheta3ia) * (dfy3ia / delta3ia)) / .001147;
        dfx3Totala += moveNode3xa;
        dfy3Totala += moveNode3ya;
        movement3a = [SKAction moveByX:moveNode3xa y:moveNode3ya duration:0.01];
        deltaTheta3ia = MAX(deltaTheta3ia, deltaTheta3Newa);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx4newa = ((xOrigin4a + dfx4Totala) - BHPosX) * 0.001147;
        dfy4newa = ((yOrigin4a + dfy4Totala) - BHPosY) * 0.001147;
        delta4Newa = sqrt(pow(dfx4newa, 2) + pow(dfy4newa, 2));
        //delta4Newa = MIN(.99, delta4Newa);
        deltaTheta4Newa = (sqrt((1 + cosf(delta4Newa)) / (1 - cosf(delta4Newa)))) * (1 / DBH);
        moveNode4xa = (MAX(0.0, deltaTheta4Newa - deltaTheta4ia) * (dfx4ia / delta4ia)) / .001147;
        moveNode4ya = (MAX(0.0, deltaTheta4Newa - deltaTheta4ia) * (dfy4ia / delta4ia)) / .001147;
        dfx4Totala += moveNode4xa;
        dfy4Totala += moveNode4ya;
        movement4a = [SKAction moveByX:moveNode4xa y:moveNode4ya duration:0.01];
        deltaTheta4ia = MAX(deltaTheta4ia, deltaTheta4Newa);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx5newa = ((xOrigin5a + dfx5Totala) - BHPosX) * 0.001147;
        dfy5newa = ((yOrigin5a + dfy5Totala) - BHPosY) * 0.001147;
        delta5Newa = sqrt(pow(dfx5newa, 2) + pow(dfy5newa, 2));
        //delta5Newa = MIN(.99, delta5Newa);
        deltaTheta5Newa = (sqrt((1 + cosf(delta5Newa)) / (1 - cosf(delta5Newa)))) * (1 / DBH);
        moveNode5xa = (MAX(0.0, deltaTheta5Newa - deltaTheta5ia) * (dfx5ia / delta5ia)) / .001147;
        moveNode5ya = (MAX(0.0, deltaTheta5Newa - deltaTheta5ia) * (dfy5ia / delta5ia)) / .001147;
        dfx5Totala += moveNode5xa;
        dfy5Totala += moveNode5ya;
        movement5a = [SKAction moveByX:moveNode5xa y:moveNode5ya duration:0.01];
        deltaTheta5ia = MAX(deltaTheta5ia, deltaTheta5Newa);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx6newa = ((xOrigin6a + dfx6Totala) - BHPosX) * 0.001147;
        dfy6newa = ((yOrigin6a + dfy6Totala) - BHPosY) * 0.001147;
        delta6Newa = sqrt(pow(dfx6newa, 2) + pow(dfy6newa, 2));
        //delta6Newa = MIN(.99, delta6Newa);
        deltaTheta6Newa = (sqrt((1 + cosf(delta6Newa)) / (1 - cosf(delta6Newa)))) * (1 / DBH);
        moveNode6xa = (MAX(0.0, deltaTheta6Newa - deltaTheta6ia) * (dfx6ia / delta6ia)) / .001147;
        moveNode6ya = (MAX(0.0, deltaTheta6Newa - deltaTheta6ia) * (dfy6ia / delta6ia)) / .001147;
        dfx6Totala += moveNode6xa;
        dfy6Totala += moveNode6ya;
        movement6a = [SKAction moveByX:moveNode6xa y:moveNode6ya duration:0.01];
        deltaTheta6ia = MAX(deltaTheta6ia, deltaTheta6Newa);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx7newa = ((xOrigin7a + dfx7Totala) - BHPosX) * 0.001147;
        dfy7newa = ((yOrigin7a + dfy7Totala) - BHPosY) * 0.001147;
        delta7Newa = sqrt(pow(dfx7newa, 2) + pow(dfy7newa, 2));
        //delta7Newa = MIN(.99, delta7Newa);
        deltaTheta7Newa = (sqrt((1 + cosf(delta7Newa)) / (1 - cosf(delta7Newa)))) * (1 / DBH);
        moveNode7xa = (MAX(0.0, deltaTheta7Newa - deltaTheta7ia) * (dfx7ia / delta7ia)) / .001147;
        moveNode7ya = (MAX(0.0, deltaTheta7Newa - deltaTheta7ia) * (dfy7ia / delta7ia)) / .001147;
        dfx7Totala += moveNode7xa;
        dfy7Totala += moveNode7ya;
        movement7a = [SKAction moveByX:moveNode7xa y:moveNode7ya duration:0.01];
        deltaTheta7ia = MAX(deltaTheta7ia, deltaTheta7Newa);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx8newa = ((xOrigin8a + dfx8Totala) - BHPosX) * 0.001147;
        dfy8newa = ((yOrigin8a + dfy8Totala) - BHPosY) * 0.001147;
        delta8Newa = sqrt(pow(dfx8newa, 2) + pow(dfy8newa, 2));
        //delta8Newa = MIN(.99, delta8New);
        deltaTheta8Newa = (sqrt((1 + cosf(delta8Newa)) / (1 - cosf(delta8Newa)))) * (1 / DBH);
        moveNode8xa = (MAX(0.0, deltaTheta8Newa - deltaTheta8ia) * (dfx8ia / delta8ia)) / .001147;
        moveNode8ya = (MAX(0.0, deltaTheta8Newa - deltaTheta8ia) * (dfy8ia / delta8ia)) / .001147;
        dfx8Totala += moveNode8xa;
        dfy8Totala += moveNode8ya;
        movement8a = [SKAction moveByX:moveNode8xa y:moveNode8ya duration:0.01];
        deltaTheta8ia = MAX(deltaTheta8ia, deltaTheta8Newa);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx9newa = ((xOrigin9a + dfx9Totala) - BHPosX) * 0.001147;
        dfy9newa = ((yOrigin9a + dfy9Totala) - BHPosY) * 0.001147;
        delta9Newa = sqrt(pow(dfx9newa, 2) + pow(dfy9newa, 2));
        //delta9Newa = MIN(.99, delta9Newa);
        deltaTheta9Newa = (sqrt((1 + cosf(delta9Newa)) / (1 - cosf(delta9Newa)))) * (1 / DBH);
        moveNode9xa = (MAX(0.0, deltaTheta9Newa - deltaTheta9ia) * (dfx9ia / delta9ia)) / .001147;
        moveNode9ya = (MAX(0.0, deltaTheta9Newa - deltaTheta9ia) * (dfy9ia / delta9ia)) / .001147;
        dfx9Totala += moveNode9xa;
        dfy9Totala += moveNode9ya;
        movement9a = [SKAction moveByX:moveNode9xa y:moveNode9ya duration:0.01];
        deltaTheta9ia = MAX(deltaTheta9ia, deltaTheta9Newa);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx10newa = ((xOrigin10a + dfx10Totala) - BHPosX) * 0.001147;
        dfy10newa = ((yOrigin10a + dfy10Totala) - BHPosY) * 0.001147;
        delta10Newa = sqrt(pow(dfx10newa, 2) + pow(dfy10newa, 2));
        //delta10Newa = MIN(.99, delta10Newa);
        deltaTheta10Newa = (sqrt((1 + cosf(delta10Newa)) / (1 - cosf(delta10Newa)))) * (1 / DBH);
        moveNode10xa = (MAX(0.0, deltaTheta10Newa - deltaTheta10ia) * (dfx10ia / delta10ia)) / .001147;
        moveNode10ya = (MAX(0.0, deltaTheta10Newa - deltaTheta10ia) * (dfy10ia / delta10ia)) / .001147;
        dfx10Totala += moveNode10xa;
        dfy10Totala += moveNode10ya;
        movement10a = [SKAction moveByX:moveNode10xa y:moveNode10ya duration:0.01];
        deltaTheta10ia = MAX(deltaTheta10ia, deltaTheta10Newa);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx11newa = ((xOrigin11a + dfx11Totala) - BHPosX) * 0.001147;
        dfy11newa = ((yOrigin11a + dfy11Totala) - BHPosY) * 0.001147;
        delta11Newa = sqrt(pow(dfx11newa, 2) + pow(dfy11newa, 2));
        //delta11Newa = MIN(.99, delta11Newa);
        deltaTheta11Newa = (sqrt((1 + cosf(delta11Newa)) / (1 - cosf(delta11Newa)))) * (1 / DBH);
        moveNode11xa = (MAX(0.0, deltaTheta11Newa - deltaTheta11ia) * (dfx11ia / delta11ia)) / .001147;
        moveNode11ya = (MAX(0.0, deltaTheta11Newa - deltaTheta11ia) * (dfy11ia / delta11ia)) / .001147;
        dfx11Totala += moveNode11xa;
        dfy11Totala += moveNode11ya;
        movement11a = [SKAction moveByX:moveNode11xa y:moveNode11ya duration:0.01];
        deltaTheta11ia = MAX(deltaTheta11ia, deltaTheta11Newa);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx12newa = ((xOrigin12a + dfx12Totala) - BHPosX) * 0.001147;
        dfy12newa = ((yOrigin12a + dfy12Totala) - BHPosY) * 0.001147;
        delta12Newa = sqrt(pow(dfx12newa, 2) + pow(dfy12newa, 2));
        //delta12Newa = MIN(.99, delta12Newa);
        deltaTheta12Newa = (sqrt((1 + cosf(delta12Newa)) / (1 - cosf(delta12Newa)))) * (1 / DBH);
        moveNode12xa = (MAX(0.0, deltaTheta12Newa - deltaTheta12ia) * (dfx12ia / delta12ia)) / .001147;
        moveNode12ya = (MAX(0.0, deltaTheta12Newa - deltaTheta12ia) * (dfy12ia / delta12ia)) / .001147;
        dfx12Totala += moveNode12xa;
        dfy12Totala += moveNode12ya;
        movement12a = [SKAction moveByX:moveNode12xa y:moveNode12ya duration:0.01];
        deltaTheta12ia = MAX(deltaTheta12ia, deltaTheta12Newa);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx13newa = ((xOrigin13a + dfx13Totala) - BHPosX) * 0.001147;
        dfy13newa = ((yOrigin13a + dfy13Totala) - BHPosY) * 0.001147;
        delta13Newa = sqrt(pow(dfx13newa, 2) + pow(dfy13newa, 2));
        //delta13Newa = MIN(.99, delta13Newa);
        deltaTheta13Newa = (sqrt((1 + cosf(delta13Newa)) / (1 - cosf(delta13Newa)))) * (1 / DBH);
        moveNode13xa = (MAX(0.0, deltaTheta13Newa - deltaTheta13ia) * (dfx13ia / delta13ia)) / .001147;
        moveNode13ya = (MAX(0.0, deltaTheta13Newa - deltaTheta13ia) * (dfy13ia / delta13ia)) / .001147;
        dfx13Totala += moveNode13xa;
        dfy13Totala += moveNode13ya;
        movement13a = [SKAction moveByX:moveNode13xa y:moveNode13ya duration:0.01];
        deltaTheta13ia = MAX(deltaTheta13ia, deltaTheta13Newa);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx14newa = ((xOrigin14a + dfx14Totala) - BHPosX) * 0.001147;
        dfy14newa = ((yOrigin14a + dfy14Totala) - BHPosY) * 0.001147;
        delta14Newa = sqrt(pow(dfx14newa, 2) + pow(dfy14newa, 2));
        //delta14Newa = MIN(.99, delta14Newa);
        deltaTheta14Newa = (sqrt((1 + cosf(delta14Newa)) / (1 - cosf(delta14Newa)))) * (1 / DBH);
        moveNode14xa = (MAX(0.0, deltaTheta14Newa - deltaTheta14ia) * (dfx14ia / delta14ia)) / .001147;
        moveNode14ya = (MAX(0.0, deltaTheta14Newa - deltaTheta14ia) * (dfy14ia / delta14ia)) / .001147;
        dfx14Totala += moveNode14xa;
        dfy14Totala += moveNode14ya;
        movement14a = [SKAction moveByX:moveNode14xa y:moveNode14ya duration:0.01];
        deltaTheta14ia = MAX(deltaTheta14ia, deltaTheta14Newa);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx15newa = ((xOrigin15a + dfx15Totala) - BHPosX) * 0.001147;
        dfy15newa = ((yOrigin15a + dfy15Totala) - BHPosY) * 0.001147;
        delta15Newa = sqrt(pow(dfx15newa, 2) + pow(dfy15newa, 2));
        //delta15Newa = MIN(.99, delta15Newa);
        deltaTheta15Newa = (sqrt((1 + cosf(delta15Newa)) / (1 - cosf(delta15Newa)))) * (1 / DBH);
        moveNode15xa = (MAX(0.0, deltaTheta15Newa - deltaTheta15ia) * (dfx15ia / delta15ia)) / .001147;
        moveNode15ya = (MAX(0.0, deltaTheta15Newa - deltaTheta15ia) * (dfy15ia / delta15ia)) / .001147;
        dfx15Totala += moveNode15xa;
        dfy15Totala += moveNode15ya;
        movement15a = [SKAction moveByX:moveNode15xa y:moveNode15ya duration:0.01];
        deltaTheta15ia = MAX(deltaTheta15ia, deltaTheta15Newa);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx16newa = ((xOrigin16a + dfx16Totala) - BHPosX) * 0.001147;
        dfy16newa = ((yOrigin16a + dfy16Totala) - BHPosY) * 0.001147;
        delta16Newa = sqrt(pow(dfx16newa, 2) + pow(dfy16newa, 2));
        //delta16Newa = MIN(.99, delta16Newa);
        deltaTheta16Newa = (sqrt((1 + cosf(delta16Newa)) / (1 - cosf(delta16Newa)))) * (1 / DBH);
        moveNode16xa = (MAX(0.0, deltaTheta16Newa - deltaTheta16ia) * (dfx16ia / delta16ia)) / .001147;
        moveNode16ya = (MAX(0.0, deltaTheta16Newa - deltaTheta16ia) * (dfy16ia / delta16ia)) / .001147;
        dfx16Totala += moveNode16xa;
        dfy16Totala += moveNode16ya;
        movement16a = [SKAction moveByX:moveNode16xa y:moveNode16ya duration:0.01];
        deltaTheta16ia = MAX(deltaTheta16ia, deltaTheta16Newa);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx17newa = ((xOrigin17a + dfx17Totala) - BHPosX) * 0.001147;
        dfy17newa = ((yOrigin17a + dfy17Totala) - BHPosY) * 0.001147;
        delta17Newa = sqrt(pow(dfx17newa, 2) + pow(dfy17newa, 2));
        //delta17Newa = MIN(.99, delta17Newa);
        deltaTheta17Newa = (sqrt((1 + cosf(delta17Newa)) / (1 - cosf(delta17Newa)))) * (1 / DBH);
        moveNode17xa = (MAX(0.0, deltaTheta17Newa - deltaTheta17ia) * (dfx17ia / delta17ia)) / .001147;
        moveNode17ya = (MAX(0.0, deltaTheta17Newa - deltaTheta17ia) * (dfy17ia / delta17ia)) / .001147;
        dfx17Totala += moveNode17xa;
        dfy17Totala += moveNode17ya;
        movement17a = [SKAction moveByX:moveNode17xa y:moveNode17ya duration:0.01];
        deltaTheta17ia = MAX(deltaTheta17ia, deltaTheta17Newa);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx18newa = ((xOrigin18a + dfx18Totala) - BHPosX) * 0.001147;
        dfy18newa = ((yOrigin18a + dfy18Totala) - BHPosY) * 0.001147;
        delta18Newa = sqrt(pow(dfx18newa, 2) + pow(dfy18newa, 2));
        //delta18Newa = MIN(.99, delta18Newa);
        deltaTheta18Newa = (sqrt((1 + cosf(delta18Newa)) / (1 - cosf(delta18Newa)))) * (1 / DBH);
        moveNode18xa = (MAX(0.0, deltaTheta18Newa - deltaTheta18ia) * (dfx18ia / delta18ia)) / .001147;
        moveNode18ya = (MAX(0.0, deltaTheta18Newa - deltaTheta18ia) * (dfy18ia / delta18ia)) / .001147;
        dfx18Totala += moveNode18xa;
        dfy18Totala += moveNode18ya;
        movement18a = [SKAction moveByX:moveNode18xa y:moveNode18ya duration:0.01];
        deltaTheta18ia = MAX(deltaTheta18ia, deltaTheta18Newa);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx19newa = ((xOrigin19a + dfx19Totala) - BHPosX) * 0.001147;
        dfy19newa = ((yOrigin19a + dfy19Totala) - BHPosY) * 0.001147;
        delta19Newa = sqrt(pow(dfx19newa, 2) + pow(dfy19newa, 2));
        //delta19Newa = MIN(.99, delta19Newa);
        deltaTheta19Newa = (sqrt((1 + cosf(delta19Newa)) / (1 - cosf(delta19Newa)))) * (1 / DBH);
        moveNode19xa = (MAX(0.0, deltaTheta19Newa - deltaTheta19ia) * (dfx19ia / delta19ia)) / .001147;
        moveNode19ya = (MAX(0.0, deltaTheta19Newa - deltaTheta19ia) * (dfy19ia / delta19ia)) / .001147;
        dfx19Totala += moveNode19xa;
        dfy19Totala += moveNode19ya;
        movement19a = [SKAction moveByX:moveNode19xa y:moveNode19ya duration:0.01];
        deltaTheta19ia = MAX(deltaTheta19ia, deltaTheta19Newa);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx20newa = ((xOrigin20a + dfx20Totala) - BHPosX) * 0.001147;
        dfy20newa = ((yOrigin20a + dfy20Totala) - BHPosY) * 0.001147;
        delta20Newa = sqrt(pow(dfx20newa, 2) + pow(dfy20newa, 2));
        //delta20Newa = MIN(.99, delta20Newa);
        deltaTheta20Newa = (sqrt((1 + cosf(delta20Newa)) / (1 - cosf(delta20Newa)))) * (1 / DBH);
        moveNode20xa = (MAX(0.0, deltaTheta20Newa - deltaTheta20ia) * (dfx20ia / delta20ia)) / .001147;
        moveNode20ya = (MAX(0.0, deltaTheta20Newa - deltaTheta20ia) * (dfy20ia / delta20ia)) / .001147;
        dfx20Totala += moveNode20xa;
        dfy20Totala += moveNode20ya;
        movement20a = [SKAction moveByX:moveNode20xa y:moveNode20ya duration:0.01];
        deltaTheta20ia = MAX(deltaTheta20ia, deltaTheta20Newa);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx21newa = ((xOrigin21a + dfx21Totala) - BHPosX) * 0.001147;
        dfy21newa = ((yOrigin21a + dfy21Totala) - BHPosY) * 0.001147;
        delta21Newa = sqrt(pow(dfx21newa, 2) + pow(dfy21newa, 2));
        //delta21Newa = MIN(.99, delta21Newa);
        deltaTheta21Newa = (sqrt((1 + cosf(delta21Newa)) / (1 - cosf(delta21Newa)))) * (1 / DBH);
        moveNode21xa = (MAX(0.0, deltaTheta21Newa - deltaTheta21ia) * (dfx21ia / delta21ia)) / .001147;
        moveNode21ya = (MAX(0.0, deltaTheta21Newa - deltaTheta21ia) * (dfy21ia / delta21ia)) / .001147;
        dfx21Totala += moveNode21xa;
        dfy21Totala += moveNode21ya;
        movement21a = [SKAction moveByX:moveNode21xa y:moveNode21ya duration:0.01];
        deltaTheta21ia = MAX(deltaTheta21ia, deltaTheta21Newa);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx22newa = ((xOrigin22a + dfx22Totala) - BHPosX) * 0.001147;
        dfy22newa = ((yOrigin22a + dfy22Totala) - BHPosY) * 0.001147;
        delta22Newa = sqrt(pow(dfx22newa, 2) + pow(dfy22newa, 2));
        //delta22Newa = MIN(.99, delta22Newa);
        deltaTheta22Newa = (sqrt((1 + cosf(delta22Newa)) / (1 - cosf(delta22Newa)))) * (1 / DBH);
        moveNode22xa = (MAX(0.0, deltaTheta22Newa - deltaTheta22ia) * (dfx22ia / delta22ia)) / .001147;
        moveNode22ya = (MAX(0.0, deltaTheta22Newa - deltaTheta22ia) * (dfy22ia / delta22ia)) / .001147;
        dfx22Totala += moveNode22xa;
        dfy22Totala += moveNode22ya;
        movement22a = [SKAction moveByX:moveNode22xa y:moveNode22ya duration:0.01];
        deltaTheta22ia = MAX(deltaTheta22ia, deltaTheta22Newa);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx23newa = ((xOrigin23a + dfx23Totala) - BHPosX) * 0.001147;
        dfy23newa = ((yOrigin23a + dfy23Totala) - BHPosY) * 0.001147;
        delta23Newa = sqrt(pow(dfx23newa, 2) + pow(dfy23newa, 2));
        //delta23Newa = MIN(.99, delta23Newa);
        deltaTheta23Newa = (sqrt((1 + cosf(delta23Newa)) / (1 - cosf(delta23Newa)))) * (1 / DBH);
        moveNode23xa = (MAX(0.0, deltaTheta23Newa - deltaTheta23ia) * (dfx23ia / delta23ia)) / .001147;
        moveNode23ya = (MAX(0.0, deltaTheta23Newa - deltaTheta23ia) * (dfy23ia / delta23ia)) / .001147;
        dfx23Totala += moveNode23xa;
        dfy23Totala += moveNode23ya;
        movement23a = [SKAction moveByX:moveNode23xa y:moveNode23ya duration:0.01];
        deltaTheta23ia = MAX(deltaTheta23ia, deltaTheta23Newa);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx24newa = ((xOrigin24a + dfx24Totala) - BHPosX) * 0.001147;
        dfy24newa = ((yOrigin24a + dfy24Totala) - BHPosY) * 0.001147;
        delta24Newa = sqrt(pow(dfx24newa, 2) + pow(dfy24newa, 2));
        //delta24Newa = MIN(.99, delta24Newa);
        deltaTheta24Newa = (sqrt((1 + cosf(delta24Newa)) / (1 - cosf(delta24Newa)))) * (1 / DBH);
        moveNode24xa = (MAX(0.0, deltaTheta24Newa - deltaTheta24ia) * (dfx24ia / delta24ia)) / .001147;
        moveNode24ya = (MAX(0.0, deltaTheta24Newa - deltaTheta24ia) * (dfy24ia / delta24ia)) / .001147;
        dfx24Totala += moveNode24xa;
        dfy24Totala += moveNode24ya;
        movement24a = [SKAction moveByX:moveNode24xa y:moveNode24ya duration:0.01];
        deltaTheta24ia = MAX(deltaTheta24ia, deltaTheta24Newa);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx25newa = ((xOrigin25a + dfx25Totala) - BHPosX) * 0.001147;
        dfy25newa = ((yOrigin25a + dfy25Totala) - BHPosY) * 0.001147;
        delta25Newa = sqrt(pow(dfx25newa, 2) + pow(dfy25newa, 2));
        //delta25Newa = MIN(.99, delta25Newa);
        deltaTheta25Newa = (sqrt((1 + cosf(delta25Newa)) / (1 - cosf(delta25Newa)))) * (1 / DBH);
        moveNode25xa = (MAX(0.0, deltaTheta25Newa - deltaTheta25ia) * (dfx25ia / delta25ia)) / .001147;
        moveNode25ya = (MAX(0.0, deltaTheta25Newa - deltaTheta25ia) * (dfy25ia / delta25ia)) / .001147;
        dfx25Totala += moveNode25xa;
        dfy25Totala += moveNode25ya;
        movement25a = [SKAction moveByX:moveNode25xa y:moveNode25ya duration:0.01];
        deltaTheta25ia = MAX(deltaTheta25ia, deltaTheta25Newa);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx26newa = ((xOrigin26a + dfx26Totala) - BHPosX) * 0.001147;
        dfy26newa = ((yOrigin26a + dfy26Totala) - BHPosY) * 0.001147;
        delta26Newa = sqrt(pow(dfx26newa, 2) + pow(dfy26newa, 2));
        //delta26Newa = MIN(.99, delta26Newa);
        deltaTheta26Newa = (sqrt((1 + cosf(delta26Newa)) / (1 - cosf(delta26Newa)))) * (1 / DBH);
        moveNode26xa = (MAX(0.0, deltaTheta26Newa - deltaTheta26ia) * (dfx26ia / delta26ia)) / .001147;
        moveNode26ya = (MAX(0.0, deltaTheta26Newa - deltaTheta26ia) * (dfy26ia / delta26ia)) / .001147;
        dfx26Totala += moveNode26xa;
        dfy26Totala += moveNode26ya;
        movement26a = [SKAction moveByX:moveNode26xa y:moveNode26ya duration:0.01];
        deltaTheta26ia = MAX(deltaTheta26ia, deltaTheta26Newa);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx27newa = ((xOrigin27a + dfx27Totala) - BHPosX) * 0.001147;
        dfy27newa = ((yOrigin27a + dfy27Totala) - BHPosY) * 0.001147;
        delta27Newa = sqrt(pow(dfx27newa, 2) + pow(dfy27newa, 2));
        //delta27Newa = MIN(.99, delta27Newa);
        deltaTheta27Newa = (sqrt((1 + cosf(delta27Newa)) / (1 - cosf(delta27Newa)))) * (1 / DBH);
        moveNode27xa = (MAX(0.0, deltaTheta27Newa - deltaTheta27ia) * (dfx27ia / delta27ia)) / .001147;
        moveNode27ya = (MAX(0.0, deltaTheta27Newa - deltaTheta27ia) * (dfy27ia / delta27ia)) / .001147;
        dfx27Totala += moveNode27xa;
        dfy27Totala += moveNode27ya;
        movement27a = [SKAction moveByX:moveNode27xa y:moveNode27ya duration:0.01];
        deltaTheta27ia = MAX(deltaTheta27ia, deltaTheta27Newa);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx28newa = ((xOrigin28a + dfx28Totala) - BHPosX) * 0.001147;
        dfy28newa = ((yOrigin28a + dfy28Totala) - BHPosY) * 0.001147;
        delta28Newa = sqrt(pow(dfx28newa, 2) + pow(dfy28newa, 2));
        //delta28Newa = MIN(.99, delta28Newa);
        deltaTheta28Newa = (sqrt((1 + cosf(delta28Newa)) / (1 - cosf(delta28Newa)))) * (1 / DBH);
        moveNode28xa = (MAX(0.0, deltaTheta28Newa - deltaTheta28ia) * (dfx28ia / delta28ia)) / .001147;
        moveNode28ya = (MAX(0.0, deltaTheta28Newa - deltaTheta28ia) * (dfy28ia / delta28ia)) / .001147;
        dfx28Totala += moveNode28xa;
        dfy28Totala += moveNode28ya;
        movement28a = [SKAction moveByX:moveNode28xa y:moveNode28ya duration:0.01];
        deltaTheta28ia = MAX(deltaTheta28ia, deltaTheta28Newa);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx29newa = ((xOrigin29a + dfx29Totala) - BHPosX) * 0.001147;
        dfy29newa = ((yOrigin29a + dfy29Totala) - BHPosY) * 0.001147;
        delta29Newa = sqrt(pow(dfx29newa, 2) + pow(dfy29newa, 2));
        //delta29Newa = MIN(.99, delta29Newa);
        deltaTheta29Newa = (sqrt((1 + cosf(delta29Newa)) / (1 - cosf(delta29Newa)))) * (1 / DBH);
        moveNode29xa = (MAX(0.0, deltaTheta29Newa - deltaTheta29ia) * (dfx29ia / delta29ia)) / .001147;
        moveNode29ya = (MAX(0.0, deltaTheta29Newa - deltaTheta29ia) * (dfy29ia / delta29ia)) / .001147;
        dfx29Totala += moveNode29xa;
        dfy29Totala += moveNode29ya;
        movement29a = [SKAction moveByX:moveNode29xa y:moveNode29ya duration:0.01];
        deltaTheta29ia = MAX(deltaTheta29ia, deltaTheta29Newa);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx30newa = ((xOrigin30a + dfx30Totala) - BHPosX) * 0.001147;
        dfy30newa = ((yOrigin30a + dfy30Totala) - BHPosY) * 0.001147;
        delta30Newa = sqrt(pow(dfx30newa, 2) + pow(dfy30newa, 2));
        //delta30Newa = MIN(.99, delta30Newa);
        deltaTheta30Newa = (sqrt((1 + cosf(delta30Newa)) / (1 - cosf(delta30Newa)))) * (1 / DBH);
        moveNode30xa = (MAX(0.0, deltaTheta30Newa - deltaTheta30ia) * (dfx30ia / delta30ia)) / .001147;
        moveNode30ya = (MAX(0.0, deltaTheta30Newa - deltaTheta30ia) * (dfy30ia / delta30ia)) / .001147;
        dfx30Totala += moveNode30xa;
        dfy30Totala += moveNode30ya;
        movement30a = [SKAction moveByX:moveNode30xa y:moveNode30ya duration:0.01];
        deltaTheta30ia = MAX(deltaTheta30ia, deltaTheta30Newa);

        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx31newa = ((xOrigin31a + dfx31Totala) - BHPosX) * 0.001147;
        dfy31newa = ((yOrigin31a + dfy31Totala) - BHPosY) * 0.001147;
        delta31Newa = sqrt(pow(dfx31newa, 2) + pow(dfy31newa, 2));
        //delta31Newa = MIN(.99, delta31Newa);
        deltaTheta31Newa = (sqrt((1 + cosf(delta31Newa)) / (1 - cosf(delta31Newa)))) * (1 / DBH);
        moveNode31xa = (MAX(0.0, deltaTheta31Newa - deltaTheta31ia) * (dfx31ia / delta31ia)) / .001147;
        moveNode31ya = (MAX(0.0, deltaTheta31Newa - deltaTheta31ia) * (dfy31ia / delta31ia)) / .001147;
        dfx31Totala += moveNode31xa;
        dfy31Totala += moveNode31ya;
        movement31a = [SKAction moveByX:moveNode31xa y:moveNode31ya duration:0.01];
        deltaTheta31ia = MAX(deltaTheta31ia, deltaTheta31Newa);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx32newa = ((xOrigin32a + dfx32Totala) - BHPosX) * 0.001147;
        dfy32newa = ((yOrigin32a + dfy32Totala) - BHPosY) * 0.001147;
        delta32Newa = sqrt(pow(dfx32newa, 2) + pow(dfy32newa, 2));
        //delta32Newa = MIN(.99, delta32Newa);
        deltaTheta32Newa = (sqrt((1 + cosf(delta32Newa)) / (1 - cosf(delta32Newa)))) * (1 / DBH);
        moveNode32xa = (MAX(0.0, deltaTheta32Newa - deltaTheta32ia) * (dfx32ia / delta32ia)) / .001147;
        moveNode32ya = (MAX(0.0, deltaTheta32Newa - deltaTheta32ia) * (dfy32ia / delta32ia)) / .001147;
        dfx32Totala += moveNode32xa;
        dfy32Totala += moveNode32ya;
        movement32a = [SKAction moveByX:moveNode32xa y:moveNode32ya duration:0.01];
        deltaTheta32ia = MAX(deltaTheta32ia, deltaTheta32Newa);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx33newa = ((xOrigin33a + dfx33Totala) - BHPosX) * 0.001147;
        dfy33newa = ((yOrigin33a + dfy33Totala) - BHPosY) * 0.001147;
        delta33Newa = sqrt(pow(dfx33newa, 2) + pow(dfy33newa, 2));
        //delta33Newa = MIN(.99, delta33Newa);
        deltaTheta33Newa = (sqrt((1 + cosf(delta33Newa)) / (1 - cosf(delta33Newa)))) * (1 / DBH);
        moveNode33xa = (MAX(0.0, deltaTheta33Newa - deltaTheta33ia) * (dfx33ia / delta33ia)) / .001147;
        moveNode33ya = (MAX(0.0, deltaTheta33Newa - deltaTheta33ia) * (dfy33ia / delta33ia)) / .001147;
        dfx33Totala += moveNode33xa;
        dfy33Totala += moveNode33ya;
        movement33a = [SKAction moveByX:moveNode33xa y:moveNode33ya duration:0.01];
        deltaTheta33ia = MAX(deltaTheta33ia, deltaTheta33Newa);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx34newa = ((xOrigin34a + dfx34Totala) - BHPosX) * 0.001147;
        dfy34newa = ((yOrigin34a + dfy34Totala) - BHPosY) * 0.001147;
        delta34Newa = sqrt(pow(dfx34newa, 2) + pow(dfy34newa, 2));
        //delta34Newa = MIN(.99, delta34Newa);
        deltaTheta34Newa = (sqrt((1 + cosf(delta34Newa)) / (1 - cosf(delta34Newa)))) * (1 / DBH);
        moveNode34xa = (MAX(0.0, deltaTheta34Newa - deltaTheta34ia) * (dfx34ia / delta34ia)) / .001147;
        moveNode34ya = (MAX(0.0, deltaTheta34Newa - deltaTheta34ia) * (dfy34ia / delta34ia)) / .001147;
        dfx34Totala += moveNode34xa;
        dfy34Totala += moveNode34ya;
        movement34a = [SKAction moveByX:moveNode34xa y:moveNode34ya duration:0.01];
        deltaTheta34ia = MAX(deltaTheta34ia, deltaTheta34Newa);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx35newa = ((xOrigin35a + dfx35Totala) - BHPosX) * 0.001147;
        dfy35newa = ((yOrigin35a + dfy35Totala) - BHPosY) * 0.001147;
        delta35Newa = sqrt(pow(dfx35newa, 2) + pow(dfy35newa, 2));
        //delta35Newa = MIN(.99, delta35Newa);
        deltaTheta35Newa = (sqrt((1 + cosf(delta35Newa)) / (1 - cosf(delta35Newa)))) * (1 / DBH);
        moveNode35xa = (MAX(0.0, deltaTheta35Newa - deltaTheta35ia) * (dfx35ia / delta35ia)) / .001147;
        moveNode35ya = (MAX(0.0, deltaTheta35Newa - deltaTheta35ia) * (dfy35ia / delta35ia)) / .001147;
        dfx35Totala += moveNode35xa;
        dfy35Totala += moveNode35ya;
        movement35a = [SKAction moveByX:moveNode35xa y:moveNode35ya duration:0.01];
        deltaTheta35ia = MAX(deltaTheta35ia, deltaTheta35Newa);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx36newa = ((xOrigin36a + dfx36Totala) - BHPosX) * 0.001147;
        dfy36newa = ((yOrigin36a + dfy36Totala) - BHPosY) * 0.001147;
        delta36Newa = sqrt(pow(dfx36newa, 2) + pow(dfy36newa, 2));
        //delta36Newa = MIN(.99, delta36Newa);
        deltaTheta36Newa = (sqrt((1 + cosf(delta36Newa)) / (1 - cosf(delta36Newa)))) * (1 / DBH);
        moveNode36xa = (MAX(0.0, deltaTheta36Newa - deltaTheta36ia) * (dfx36ia / delta36ia)) / .001147;
        moveNode36ya = (MAX(0.0, deltaTheta36Newa - deltaTheta36ia) * (dfy36ia / delta36ia)) / .001147;
        dfx36Totala += moveNode36xa;
        dfy36Totala += moveNode36ya;
        movement36a = [SKAction moveByX:moveNode36xa y:moveNode36ya duration:0.01];
        deltaTheta36ia = MAX(deltaTheta36ia, deltaTheta36Newa);
       
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx37newa = ((xOrigin37a + dfx37Totala) - BHPosX) * 0.001147;
        dfy37newa = ((yOrigin37a + dfy37Totala) - BHPosY) * 0.001147;
        delta37Newa = sqrt(pow(dfx37newa, 2) + pow(dfy37newa, 2));
        //delta37Newa = MIN(.99, delta37Newa);
        deltaTheta37Newa = (sqrt((1 + cosf(delta37Newa)) / (1 - cosf(delta37Newa)))) * (1 / DBH);
        moveNode37xa = (MAX(0.0, deltaTheta37Newa - deltaTheta37ia) * (dfx37ia / delta37ia)) / .001147;
        moveNode37ya = (MAX(0.0, deltaTheta37Newa - deltaTheta37ia) * (dfy37ia / delta37ia)) / .001147;
        dfx37Totala += moveNode37xa;
        dfy37Totala += moveNode37ya;
        movement37a = [SKAction moveByX:moveNode37xa y:moveNode37ya duration:0.01];
        deltaTheta37ia = MAX(deltaTheta37ia, deltaTheta37Newa);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx38newa = ((xOrigin38a + dfx38Totala) - BHPosX) * 0.001147;
        dfy38newa = ((yOrigin38a + dfy38Totala) - BHPosY) * 0.001147;
        delta38Newa = sqrt(pow(dfx38newa, 2) + pow(dfy38newa, 2));
        //delta38Newa = MIN(.99, delta38Newa);
        deltaTheta38Newa = (sqrt((1 + cosf(delta38Newa)) / (1 - cosf(delta38Newa)))) * (1 / DBH);
        moveNode38xa = (MAX(0.0, deltaTheta38Newa - deltaTheta38ia) * (dfx38ia / delta38ia)) / .001147;
        moveNode38ya = (MAX(0.0, deltaTheta38Newa - deltaTheta38ia) * (dfy38ia / delta38ia)) / .001147;
        dfx38Totala += moveNode38xa;
        dfy38Totala += moveNode38ya;
        movement38a = [SKAction moveByX:moveNode38xa y:moveNode38ya duration:0.01];
        deltaTheta38ia = MAX(deltaTheta38ia, deltaTheta38Newa);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx39newa = ((xOrigin39a + dfx39Totala) - BHPosX) * 0.001147;
        dfy39newa = ((yOrigin39a + dfy39Totala) - BHPosY) * 0.001147;
        delta39Newa = sqrt(pow(dfx39newa, 2) + pow(dfy39newa, 2));
        //delta39Newa = MIN(.99, delta39Newa);
        deltaTheta39Newa = (sqrt((1 + cosf(delta39Newa)) / (1 - cosf(delta39Newa)))) * (1 / DBH);
        moveNode39xa = (MAX(0.0, deltaTheta39Newa - deltaTheta39ia) * (dfx39ia / delta39ia)) / .001147;
        moveNode39ya = (MAX(0.0, deltaTheta39Newa - deltaTheta39ia) * (dfy39ia / delta39ia)) / .001147;
        dfx39Totala += moveNode39xa;
        dfy39Totala += moveNode39ya;
        movement39a = [SKAction moveByX:moveNode39xa y:moveNode39ya duration:0.01];
        deltaTheta39ia = MAX(deltaTheta39ia, deltaTheta39Newa);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx40newa = ((xOrigin40a + dfx40Totala) - BHPosX) * 0.001147;
        dfy40newa = ((yOrigin40a + dfy40Totala) - BHPosY) * 0.001147;
        delta40Newa = sqrt(pow(dfx40newa, 2) + pow(dfy40newa, 2));
        //delta40Newa = MIN(.99, delta40Newa);
        deltaTheta40Newa = (sqrt((1 + cosf(delta40Newa)) / (1 - cosf(delta40Newa)))) * (1 / DBH);
        moveNode40xa = (MAX(0.0, deltaTheta40Newa - deltaTheta40ia) * (dfx40ia / delta40ia)) / .001147;
        moveNode40ya = (MAX(0.0, deltaTheta40Newa - deltaTheta40ia) * (dfy40ia / delta40ia)) / .001147;
        dfx40Totala += moveNode40xa;
        dfy40Totala += moveNode40ya;
        movement40a = [SKAction moveByX:moveNode40xa y:moveNode40ya duration:0.01];
        deltaTheta40ia = MAX(deltaTheta40ia, deltaTheta40Newa);
       
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx41newa = ((xOrigin41a + dfx41Totala) - BHPosX) * 0.001147;
        dfy41newa = ((yOrigin41a + dfy41Totala) - BHPosY) * 0.001147;
        delta41Newa = sqrt(pow(dfx41newa, 2) + pow(dfy41newa, 2));
        //delta41Newa = MIN(.99, delta41Newa);
        deltaTheta41Newa = (sqrt((1 + cosf(delta41Newa)) / (1 - cosf(delta41Newa)))) * (1 / DBH);
        moveNode41xa = (MAX(0.0, deltaTheta41Newa - deltaTheta41ia) * (dfx41ia / delta41ia)) / .001147;
        moveNode41ya = (MAX(0.0, deltaTheta41Newa - deltaTheta41ia) * (dfy41ia / delta41ia)) / .001147;
        dfx41Totala += moveNode41xa;
        dfy41Totala += moveNode41ya;
        movement41a = [SKAction moveByX:moveNode41xa y:moveNode41ya duration:0.01];
        deltaTheta41ia = MAX(deltaTheta41ia, deltaTheta41Newa);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx42newa = ((xOrigin42a + dfx42Totala) - BHPosX) * 0.001147;
        dfy42newa = ((yOrigin42a + dfy42Totala) - BHPosY) * 0.001147;
        delta42Newa = sqrt(pow(dfx42newa, 2) + pow(dfy42newa, 2));
        //delta42Newa = MIN(.99, delta42Newa);
        deltaTheta42Newa = (sqrt((1 + cosf(delta42Newa)) / (1 - cosf(delta42Newa)))) * (1 / DBH);
        moveNode42xa = (MAX(0.0, deltaTheta42Newa - deltaTheta42ia) * (dfx42ia / delta42ia)) / .001147;
        moveNode42ya = (MAX(0.0, deltaTheta42Newa - deltaTheta42ia) * (dfy42ia / delta42ia)) / .001147;
        dfx42Totala += moveNode42xa;
        dfy42Totala += moveNode42ya;
        movement42a = [SKAction moveByX:moveNode42xa y:moveNode42ya duration:0.01];
        deltaTheta42ia = MAX(deltaTheta42ia, deltaTheta42Newa);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx43newa = ((xOrigin43a + dfx43Totala) - BHPosX) * 0.001147;
        dfy43newa = ((yOrigin43a + dfy43Totala) - BHPosY) * 0.001147;
        delta43Newa = sqrt(pow(dfx43newa, 2) + pow(dfy43newa, 2));
        //delta43Newa = MIN(.99, delta43Newa);
        deltaTheta43Newa = (sqrt((1 + cosf(delta43Newa)) / (1 - cosf(delta43Newa)))) * (1 / DBH);
        moveNode43xa = (MAX(0.0, deltaTheta43Newa - deltaTheta43ia) * (dfx43ia / delta43ia)) / .001147;
        moveNode43ya = (MAX(0.0, deltaTheta43Newa - deltaTheta43ia) * (dfy43ia / delta43ia)) / .001147;
        dfx43Totala += moveNode43xa;
        dfy43Totala += moveNode43ya;
        movement43a = [SKAction moveByX:moveNode43xa y:moveNode43ya duration:0.01];
        deltaTheta43ia = MAX(deltaTheta43ia, deltaTheta43Newa);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx44newa = ((xOrigin44a + dfx44Totala) - BHPosX) * 0.001147;
        dfy44newa = ((yOrigin44a + dfy44Totala) - BHPosY) * 0.001147;
        delta44Newa = sqrt(pow(dfx44newa, 2) + pow(dfy44newa, 2));
        //delta44Newa = MIN(.99, delta44Newa);
        deltaTheta44Newa = (sqrt((1 + cosf(delta44Newa)) / (1 - cosf(delta44Newa)))) * (1 / DBH);
        moveNode44xa = (MAX(0.0, deltaTheta44Newa - deltaTheta44ia) * (dfx44ia / delta44ia)) / .001147;
        moveNode44ya = (MAX(0.0, deltaTheta44Newa - deltaTheta44ia) * (dfy44ia / delta44ia)) / .001147;
        dfx44Totala += moveNode44xa;
        dfy44Totala += moveNode44ya;
        movement44a = [SKAction moveByX:moveNode44xa y:moveNode44ya duration:0.01];
        deltaTheta44ia = MAX(deltaTheta44ia, deltaTheta44Newa);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx45newa = ((xOrigin45a + dfx45Totala) - BHPosX) * 0.001147;
        dfy45newa = ((yOrigin45a + dfy45Totala) - BHPosY) * 0.001147;
        delta45Newa = sqrt(pow(dfx45newa, 2) + pow(dfy45newa, 2));
        //delta45Newa = MIN(.99, delta45Newa);
        deltaTheta45Newa = (sqrt((1 + cosf(delta45Newa)) / (1 - cosf(delta45Newa)))) * (1 / DBH);
        moveNode45xa = (MAX(0.0, deltaTheta45Newa - deltaTheta45ia) * (dfx45ia / delta45ia)) / .001147;
        moveNode45ya = (MAX(0.0, deltaTheta45Newa - deltaTheta45ia) * (dfy45ia / delta45ia)) / .001147;
        dfx45Totala += moveNode45xa;
        dfy45Totala += moveNode45ya;
        movement45a = [SKAction moveByX:moveNode45xa y:moveNode45ya duration:0.01];
        deltaTheta45ia = MAX(deltaTheta45ia, deltaTheta45Newa);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx46newa = ((xOrigin46a + dfx46Totala) - BHPosX) * 0.001147;
        dfy46newa = ((yOrigin46a + dfy46Totala) - BHPosY) * 0.001147;
        delta46Newa = sqrt(pow(dfx46newa, 2) + pow(dfy46newa, 2));
        //delta46Newa = MIN(.99, delta46Newa);
        deltaTheta46Newa = (sqrt((1 + cosf(delta46Newa)) / (1 - cosf(delta46Newa)))) * (1 / DBH);
        moveNode46xa = (MAX(0.0, deltaTheta46Newa - deltaTheta46ia) * (dfx46ia / delta46ia)) / .001147;
        moveNode46ya = (MAX(0.0, deltaTheta46Newa - deltaTheta46ia) * (dfy46ia / delta46ia)) / .001147;
        dfx46Totala += moveNode46xa;
        dfy46Totala += moveNode46ya;
        movement46a = [SKAction moveByX:moveNode46xa y:moveNode46ya duration:0.01];
        deltaTheta46ia = MAX(deltaTheta46ia, deltaTheta46Newa);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx47newa = ((xOrigin47a + dfx47Totala) - BHPosX) * 0.001147;
        dfy47newa = ((yOrigin47a + dfy47Totala) - BHPosY) * 0.001147;
        delta47Newa = sqrt(pow(dfx47newa, 2) + pow(dfy47newa, 2));
        //delta47Newa = MIN(.99, delta47Newa);
        deltaTheta47Newa = (sqrt((1 + cosf(delta47Newa)) / (1 - cosf(delta47Newa)))) * (1 / DBH);
        moveNode47xa = (MAX(0.0, deltaTheta47Newa - deltaTheta47ia) * (dfx47ia / delta47ia)) / .001147;
        moveNode47ya = (MAX(0.0, deltaTheta47Newa - deltaTheta47ia) * (dfy47ia / delta47ia)) / .001147;
        dfx47Totala += moveNode47xa;
        dfy47Totala += moveNode47ya;
        movement47a = [SKAction moveByX:moveNode47xa y:moveNode47ya duration:0.01];
        deltaTheta47ia = MAX(deltaTheta47ia, deltaTheta47Newa);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        [shapeNode1 runAction: movement1];
        shapeNode1.xScale = deltaMag1;
        shapeNode1.yScale = deltaMag1;
        
        [shapeNode2 runAction: movement2];
        shapeNode2.xScale = deltaMag2;
        shapeNode2.yScale = deltaMag2;
        
        [shapeNode3 runAction: movement3];
        shapeNode3.xScale = deltaMag3;
        shapeNode3.yScale = deltaMag3;
        
        [shapeNode4 runAction: movement4];
        shapeNode4.xScale = deltaMag4;
        shapeNode4.yScale = deltaMag4;
        
        [shapeNode5 runAction: movement5];
        shapeNode5.xScale = deltaMag5;
        shapeNode5.yScale = deltaMag5;
        
        [shapeNode6 runAction: movement6];
        shapeNode6.xScale = deltaMag6;
        shapeNode6.yScale = deltaMag6;
        
        [shapeNode7 runAction: movement7];
        shapeNode7.xScale = deltaMag7;
        shapeNode7.yScale = deltaMag7;
        
        [shapeNode8 runAction: movement8];
        shapeNode8.xScale = deltaMag8;
        shapeNode8.yScale = deltaMag8;
        
        [shapeNode9 runAction: movement9];
        shapeNode9.xScale = deltaMag9;
        shapeNode9.yScale = deltaMag9;
        
        [shapeNode10 runAction: movement10];
        shapeNode10.xScale = deltaMag10;
        shapeNode10.yScale = deltaMag10;
        
        [shapeNode11 runAction: movement11];
        shapeNode11.xScale = deltaMag11;
        shapeNode11.yScale = deltaMag11;
        
        [shapeNode12 runAction: movement12];
        shapeNode12.xScale = deltaMag12;
        shapeNode12.yScale = deltaMag12;
        
        [shapeNode13 runAction: movement13];
        shapeNode13.xScale = deltaMag13;
        shapeNode13.yScale = deltaMag13;
        
        [shapeNode14 runAction: movement14];
        shapeNode14.xScale = deltaMag14;
        shapeNode14.yScale = deltaMag14;
        
        [shapeNode15 runAction: movement15];
        shapeNode15.xScale = deltaMag15;
        shapeNode15.yScale = deltaMag15;
        
        [shapeNode16 runAction: movement16];
        shapeNode16.xScale = deltaMag16;
        shapeNode16.yScale = deltaMag16;
        
        [shapeNode17 runAction: movement17];
        shapeNode17.xScale = deltaMag17;
        shapeNode17.yScale = deltaMag17;
        
        [shapeNode18 runAction: movement18];
        shapeNode18.xScale = deltaMag18;
        shapeNode18.yScale = deltaMag18;
        
        [shapeNode19 runAction: movement19];
        shapeNode19.xScale = deltaMag19;
        shapeNode19.yScale = deltaMag19;
        
        [shapeNode20 runAction: movement20];
        shapeNode20.xScale = deltaMag20;
        shapeNode20.yScale = deltaMag20;
        
        [shapeNode21 runAction: movement21];
        shapeNode21.xScale = deltaMag21;
        shapeNode21.yScale = deltaMag21;
        
        [shapeNode22 runAction: movement22];
        shapeNode22.xScale = deltaMag22;
        shapeNode22.yScale = deltaMag22;
        
        [shapeNode23 runAction: movement23];
        shapeNode23.xScale = deltaMag23;
        shapeNode23.yScale = deltaMag23;
        
        [shapeNode24 runAction: movement24];
        shapeNode24.xScale = deltaMag24;
        shapeNode24.yScale = deltaMag24;
        
        [shapeNode25 runAction: movement25];
        shapeNode25.xScale = deltaMag25;
        shapeNode25.yScale = deltaMag25;
        
        [shapeNode26 runAction: movement26];
        shapeNode26.xScale = deltaMag26;
        shapeNode26.yScale = deltaMag26;
        
        [shapeNode27 runAction: movement27];
        shapeNode27.xScale = deltaMag27;
        shapeNode27.yScale = deltaMag27;
        
        [shapeNode28 runAction: movement28];
        shapeNode28.xScale = deltaMag28;
        shapeNode28.yScale = deltaMag28;
        
        [shapeNode29 runAction: movement29];
        shapeNode29.xScale = deltaMag29;
        shapeNode29.yScale = deltaMag29;
        
        [shapeNode30 runAction: movement30];
        shapeNode30.xScale = deltaMag30;
        shapeNode30.yScale = deltaMag30;
        
        [shapeNode31 runAction: movement31];
        shapeNode31.xScale = deltaMag31;
        shapeNode31.yScale = deltaMag31;
        
        [shapeNode32 runAction: movement32];
        shapeNode32.xScale = deltaMag32;
        shapeNode32.yScale = deltaMag32;
        
        [shapeNode33 runAction: movement33];
        shapeNode33.xScale = deltaMag33;
        shapeNode33.yScale = deltaMag33;
        
        [shapeNode34 runAction: movement34];
        shapeNode34.xScale = deltaMag34;
        shapeNode34.yScale = deltaMag34;
        
        [shapeNode35 runAction: movement35];
        shapeNode35.xScale = deltaMag35;
        shapeNode35.yScale = deltaMag35;
        
        [shapeNode36 runAction: movement36];
        shapeNode36.xScale = deltaMag36;
        shapeNode36.yScale = deltaMag36;
        
        [shapeNode37 runAction: movement37];
        shapeNode37.xScale = deltaMag37;
        shapeNode37.yScale = deltaMag37;
        
        [shapeNode38 runAction: movement38];
        shapeNode38.xScale = deltaMag38;
        shapeNode38.yScale = deltaMag38;
        
        [shapeNode39 runAction: movement39];
        shapeNode39.xScale = deltaMag39;
        shapeNode39.yScale = deltaMag39;
        
        [shapeNode40 runAction: movement40];
        shapeNode40.xScale = deltaMag40;
        shapeNode40.yScale = deltaMag40;
        
        [shapeNode41 runAction: movement41];
        shapeNode41.xScale = deltaMag41;
        shapeNode41.yScale = deltaMag41;
        
        [shapeNode42 runAction: movement42];
        shapeNode42.xScale = deltaMag42;
        shapeNode42.yScale = deltaMag42;
        
        [shapeNode43 runAction: movement43];
        shapeNode43.xScale = deltaMag43;
        shapeNode43.yScale = deltaMag43;
        
        [shapeNode44 runAction: movement44];
        shapeNode44.xScale = deltaMag44;
        shapeNode44.yScale = deltaMag44;
        
        [shapeNode45 runAction: movement45];
        shapeNode45.xScale = deltaMag45;
        shapeNode45.yScale = deltaMag45;
        
        [shapeNode46 runAction: movement46];
        shapeNode46.xScale = deltaMag46;
        shapeNode46.yScale = deltaMag46;
        
        [shapeNode47 runAction: movement47];
        shapeNode47.xScale = deltaMag47;
        shapeNode47.yScale = deltaMag47;
        
        
        //Ambient stars
        [shapeNode1a runAction: movement1a];
        shapeNode1a.xScale = deltaMag1a;
        shapeNode1a.yScale = deltaMag1a;
        
        [shapeNode2a runAction: movement2a];
        shapeNode2a.xScale = deltaMag2a;
        shapeNode2a.yScale = deltaMag2a;
        
        [shapeNode3a runAction: movement3a];
        shapeNode3a.xScale = deltaMag3a;
        shapeNode3a.yScale = deltaMag3a;
        
        [shapeNode4a runAction: movement4a];
        shapeNode4a.xScale = deltaMag4a;
        shapeNode4a.yScale = deltaMag4a;
        
        [shapeNode5a runAction: movement5a];
        shapeNode5a.xScale = deltaMag5a;
        shapeNode5a.yScale = deltaMag5a;
        
        [shapeNode6a runAction: movement6a];
        shapeNode6a.xScale = deltaMag6a;
        shapeNode6a.yScale = deltaMag6a;
        
        [shapeNode7a runAction: movement7a];
        shapeNode7a.xScale = deltaMag7a;
        shapeNode7a.yScale = deltaMag7a;
        
        [shapeNode8a runAction: movement8a];
        shapeNode8a.xScale = deltaMag8a;
        shapeNode8a.yScale = deltaMag8a;
        
        [shapeNode9a runAction: movement9a];
        shapeNode9a.xScale = deltaMag9a;
        shapeNode9a.yScale = deltaMag9a;
        
        [shapeNode10a runAction: movement10a];
        shapeNode10a.xScale = deltaMag10a;
        shapeNode10a.yScale = deltaMag10a;
        
        [shapeNode11a runAction: movement11a];
        shapeNode11a.xScale = deltaMag11a;
        shapeNode11a.yScale = deltaMag11a;
        
        [shapeNode12a runAction: movement12a];
        shapeNode12a.xScale = deltaMag12a;
        shapeNode12a.yScale = deltaMag12a;
        
        [shapeNode13a runAction: movement13a];
        shapeNode13a.xScale = deltaMag13a;
        shapeNode13a.yScale = deltaMag13a;
        
        [shapeNode14a runAction: movement14a];
        shapeNode14a.xScale = deltaMag14a;
        shapeNode14a.yScale = deltaMag14a;
        
        [shapeNode15a runAction: movement15a];
        shapeNode15a.xScale = deltaMag15a;
        shapeNode15a.yScale = deltaMag15a;
        
        [shapeNode16a runAction: movement16a];
        shapeNode16a.xScale = deltaMag16a;
        shapeNode16a.yScale = deltaMag16a;
        
        [shapeNode17a runAction: movement17a];
        shapeNode17a.xScale = deltaMag17a;
        shapeNode17a.yScale = deltaMag17a;
        
        [shapeNode18a runAction: movement18a];
        shapeNode18a.xScale = deltaMag18a;
        shapeNode18a.yScale = deltaMag18a;
        
        [shapeNode19a runAction: movement19a];
        shapeNode19a.xScale = deltaMag19a;
        shapeNode19a.yScale = deltaMag19a;
        
        [shapeNode20a runAction: movement20a];
        shapeNode20a.xScale = deltaMag20a;
        shapeNode20a.yScale = deltaMag20a;
        
        [shapeNode21a runAction: movement21a];
        shapeNode21a.xScale = deltaMag21a;
        shapeNode21a.yScale = deltaMag21a;
        
        [shapeNode22a runAction: movement22a];
        shapeNode22a.xScale = deltaMag22a;
        shapeNode22a.yScale = deltaMag22a;
        
        [shapeNode23a runAction: movement23a];
        shapeNode23a.xScale = deltaMag23a;
        shapeNode23a.yScale = deltaMag23a;
        
        [shapeNode24a runAction: movement24a];
        shapeNode24a.xScale = deltaMag24a;
        shapeNode24a.yScale = deltaMag24a;
        
        [shapeNode25a runAction: movement25a];
        shapeNode25a.xScale = deltaMag25a;
        shapeNode25a.yScale = deltaMag25a;
        
        [shapeNode26a runAction: movement26a];
        shapeNode26a.xScale = deltaMag26a;
        shapeNode26a.yScale = deltaMag26a;
        
        [shapeNode27a runAction: movement27a];
        shapeNode27a.xScale = deltaMag27a;
        shapeNode27a.yScale = deltaMag27a;
        
        [shapeNode28a runAction: movement28a];
        shapeNode28a.xScale = deltaMag28a;
        shapeNode28a.yScale = deltaMag28a;
        
        [shapeNode29a runAction: movement29a];
        shapeNode29a.xScale = deltaMag29a;
        shapeNode29a.yScale = deltaMag29a;
        
        [shapeNode30a runAction: movement30a];
        shapeNode30a.xScale = deltaMag30a;
        shapeNode30a.yScale = deltaMag30a;
        
        [shapeNode31a runAction: movement31a];
        shapeNode31a.xScale = deltaMag31a;
        shapeNode31a.yScale = deltaMag31a;
        
        [shapeNode32a runAction: movement32a];
        shapeNode32a.xScale = deltaMag32a;
        shapeNode32a.yScale = deltaMag32a;
        
        [shapeNode33a runAction: movement33a];
        shapeNode33a.xScale = deltaMag33a;
        shapeNode33a.yScale = deltaMag33a;
        
        [shapeNode34a runAction: movement34a];
        shapeNode34a.xScale = deltaMag34a;
        shapeNode34a.yScale = deltaMag34a;
        
        [shapeNode35a runAction: movement35a];
        shapeNode35a.xScale = deltaMag35a;
        shapeNode35a.yScale = deltaMag35a;
        
        [shapeNode36a runAction: movement36a];
        shapeNode36a.xScale = deltaMag36a;
        shapeNode36a.yScale = deltaMag36a;
        
        [shapeNode37a runAction: movement37a];
        shapeNode37a.xScale = deltaMag37a;
        shapeNode37a.yScale = deltaMag37a;
        
        [shapeNode38a runAction: movement38a];
        shapeNode38a.xScale = deltaMag38a;
        shapeNode38a.yScale = deltaMag38a;
        
        [shapeNode39a runAction: movement39a];
        shapeNode39a.xScale = deltaMag39a;
        shapeNode39a.yScale = deltaMag39a;
        
        [shapeNode40a runAction: movement40a];
        shapeNode40a.xScale = deltaMag40a;
        shapeNode40a.yScale = deltaMag40a;
        
        [shapeNode41a runAction: movement41a];
        shapeNode41a.xScale = deltaMag41a;
        shapeNode41a.yScale = deltaMag41a;
        
        [shapeNode42a runAction: movement42a];
        shapeNode42a.xScale = deltaMag42a;
        shapeNode42a.yScale = deltaMag42a;
        
        [shapeNode43a runAction: movement43a];
        shapeNode43a.xScale = deltaMag43a;
        shapeNode43a.yScale = deltaMag43a;
        
        [shapeNode44a runAction: movement44a];
        shapeNode44a.xScale = deltaMag44a;
        shapeNode44a.yScale = deltaMag44a;
        
        [shapeNode45a runAction: movement45a];
        shapeNode45a.xScale = deltaMag45a;
        shapeNode45a.yScale = deltaMag45a;
        
        [shapeNode46a runAction: movement46a];
        shapeNode46a.xScale = deltaMag46a;
        shapeNode46a.yScale = deltaMag46a;
        
        [shapeNode47a runAction: movement47a];
        shapeNode47a.xScale = deltaMag47a;
        shapeNode47a.yScale = deltaMag47a;
    }
    
}

- (void) moveNodesIn {
    if (count >= 1) {
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        //Node paths
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx1new = ((xOrigin1 + dfx1Total) - BHPosX) * 0.001147;
        dfy1new = ((yOrigin1 + dfy1Total) - BHPosY) * 0.001147;
        delta1New = sqrt(pow(dfx1new, 2) + pow(dfy1new, 2));
        //delta1New = MIN(.99, delta1New);
        deltaTheta1New = (sqrt((1 + cosf(delta1New)) / (1 - cosf(delta1New)))) * (1 / DBH);
        moveNode1x = (MIN(0.0, deltaTheta1New - deltaTheta1i) * (dfx1i / delta1i)) / .001147;
        moveNode1y = (MIN(0.0, deltaTheta1New - deltaTheta1i) * (dfy1i / delta1i)) / .001147;
        dfx1Total += moveNode1x;
        dfy1Total += moveNode1y;
        movement1 = [SKAction moveByX:moveNode1x y:moveNode1y duration:0.01];
        deltaTheta1i = MIN(deltaTheta1i, deltaTheta1New);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx2new = ((xOrigin2 + dfx2Total) - BHPosX) * 0.001147;
        dfy2new = ((yOrigin2 + dfy2Total) - BHPosY) * 0.001147;
        delta2New = sqrt(pow(dfx2new, 2) + pow(dfy2new, 2));
        //delta2New = MIN(.99, delta2New);
        deltaTheta2New = (sqrt((1 + cosf(delta2New)) / (1 - cosf(delta2New)))) * (1 / DBH);
        moveNode2x = (MIN(0.0, deltaTheta2New - deltaTheta2i) * (dfx2i / delta2i)) / .001147;
        moveNode2y = (MIN(0.0, deltaTheta2New - deltaTheta2i) * (dfy2i / delta2i)) / .001147;
        dfx2Total += moveNode2x;
        dfy2Total += moveNode2y;
        movement2 = [SKAction moveByX:moveNode2x y:moveNode2y duration:0.01];
        deltaTheta2i = MIN(deltaTheta2i, deltaTheta2New);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx3new = ((xOrigin3 + dfx3Total) - BHPosX) * 0.001147;
        dfy3new = ((yOrigin3 + dfy3Total) - BHPosY) * 0.001147;
        delta3New = sqrt(pow(dfx3new, 2) + pow(dfy3new, 2));
        //delta3New = MIN(.99, delta3New);
        deltaTheta3New = (sqrt((1 + cosf(delta3New)) / (1 - cosf(delta3New)))) * (1 / DBH);
        moveNode3x = (MIN(0.0, deltaTheta3New - deltaTheta3i) * (dfx3i / delta3i)) / .001147;
        moveNode3y = (MIN(0.0, deltaTheta3New - deltaTheta3i) * (dfy3i / delta3i)) / .001147;
        dfx3Total += moveNode3x;
        dfy3Total += moveNode3y;
        movement3 = [SKAction moveByX:moveNode3x y:moveNode3y duration:0.01];
        deltaTheta3i = MIN(deltaTheta3i, deltaTheta3New);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx4new = ((xOrigin4 + dfx4Total) - BHPosX) * 0.001147;
        dfy4new = ((yOrigin4 + dfy4Total) - BHPosY) * 0.001147;
        delta4New = sqrt(pow(dfx4new, 2) + pow(dfy4new, 2));
        //delta4New = MIN(.99, delta4New);
        deltaTheta4New = (sqrt((1 + cosf(delta4New)) / (1 - cosf(delta4New)))) * (1 / DBH);
        moveNode4x = (MIN(0.0, deltaTheta4New - deltaTheta4i) * (dfx4i / delta4i)) / .001147;
        moveNode4y = (MIN(0.0, deltaTheta4New - deltaTheta4i) * (dfy4i / delta4i)) / .001147;
        dfx4Total += moveNode4x;
        dfy4Total += moveNode4y;
        movement4 = [SKAction moveByX:moveNode4x y:moveNode4y duration:0.01];
        deltaTheta4i = MIN(deltaTheta4i, deltaTheta4New);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx5new = ((xOrigin5 + dfx5Total) - BHPosX) * 0.001147;
        dfy5new = ((yOrigin5 + dfy5Total) - BHPosY) * 0.001147;
        delta5New = sqrt(pow(dfx5new, 2) + pow(dfy5new, 2));
        //delta5New = MIN(.99, delta5New);
        deltaTheta5New = (sqrt((1 + cosf(delta5New)) / (1 - cosf(delta5New)))) * (1 / DBH);
        moveNode5x = (MIN(0.0, deltaTheta5New - deltaTheta5i) * (dfx5i / delta5i)) / .001147;
        moveNode5y = (MIN(0.0, deltaTheta5New - deltaTheta5i) * (dfy5i / delta5i)) / .001147;
        dfx5Total += moveNode5x;
        dfy5Total += moveNode5y;
        movement5 = [SKAction moveByX:moveNode5x y:moveNode5y duration:0.01];
        deltaTheta5i = MIN(deltaTheta5i, deltaTheta5New);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx6new = ((xOrigin6 + dfx6Total) - BHPosX) * 0.001147;
        dfy6new = ((yOrigin6 + dfy6Total) - BHPosY) * 0.001147;
        delta6New = sqrt(pow(dfx6new, 2) + pow(dfy6new, 2));
        //delta6New = MIN(.99, delta6New);
        deltaTheta6New = (sqrt((1 + cosf(delta6New)) / (1 - cosf(delta6New)))) * (1 / DBH);
        moveNode6x = (MIN(0.0, deltaTheta6New - deltaTheta6i) * (dfx6i / delta6i)) / .001147;
        moveNode6y = (MIN(0.0, deltaTheta6New - deltaTheta6i) * (dfy6i / delta6i)) / .001147;
        dfx6Total += moveNode6x;
        dfy6Total += moveNode6y;
        movement6 = [SKAction moveByX:moveNode6x y:moveNode6y duration:0.01];
        deltaTheta6i = MIN(deltaTheta6i, deltaTheta6New);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx7new = ((xOrigin7 + dfx7Total) - BHPosX) * 0.001147;
        dfy7new = ((yOrigin7 + dfy7Total) - BHPosY) * 0.001147;
        delta7New = sqrt(pow(dfx7new, 2) + pow(dfy7new, 2));
        //delta7New = MIN(.99, delta7New);
        deltaTheta7New = (sqrt((1 + cosf(delta7New)) / (1 - cosf(delta7New)))) * (1 / DBH);
        moveNode7x = (MIN(0.0, deltaTheta7New - deltaTheta7i) * (dfx7i / delta7i)) / .001147;
        moveNode7y = (MIN(0.0, deltaTheta7New - deltaTheta7i) * (dfy7i / delta7i)) / .001147;
        dfx7Total += moveNode7x;
        dfy7Total += moveNode7y;
        movement7 = [SKAction moveByX:moveNode7x y:moveNode7y duration:0.01];
        deltaTheta7i = MIN(deltaTheta7i, deltaTheta7New);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx8new = ((xOrigin8 + dfx8Total) - BHPosX) * 0.001147;
        dfy8new = ((yOrigin8 + dfy8Total) - BHPosY) * 0.001147;
        delta8New = sqrt(pow(dfx8new, 2) + pow(dfy8new, 2));
        //delta8New = MIN(.99, delta8New);
        deltaTheta8New = (sqrt((1 + cosf(delta8New)) / (1 - cosf(delta8New)))) * (1 / DBH);
        moveNode8x = (MIN(0.0, deltaTheta8New - deltaTheta8i) * (dfx8i / delta8i)) / .001147;
        moveNode8y = (MIN(0.0, deltaTheta8New - deltaTheta8i) * (dfy8i / delta8i)) / .001147;
        dfx8Total += moveNode8x;
        dfy8Total += moveNode8y;
        movement8 = [SKAction moveByX:moveNode8x y:moveNode8y duration:0.01];
        deltaTheta8i = MIN(deltaTheta8i, deltaTheta8New);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx9new = ((xOrigin9 + dfx9Total) - BHPosX) * 0.001147;
        dfy9new = ((yOrigin9 + dfy9Total) - BHPosY) * 0.001147;
        delta9New = sqrt(pow(dfx9new, 2) + pow(dfy9new, 2));
        //delta9New = MIN(.99, delta9New);
        deltaTheta9New = (sqrt((1 + cosf(delta9New)) / (1 - cosf(delta9New)))) * (1 / DBH);
        moveNode9x = (MIN(0.0, deltaTheta9New - deltaTheta9i) * (dfx9i / delta9i)) / .001147;
        moveNode9y = (MIN(0.0, deltaTheta9New - deltaTheta9i) * (dfy9i / delta9i)) / .001147;
        dfx9Total += moveNode9x;
        dfy9Total += moveNode9y;
        movement9 = [SKAction moveByX:moveNode9x y:moveNode9y duration:0.01];
        deltaTheta9i = MIN(deltaTheta9i, deltaTheta9New);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx10new = ((xOrigin10 + dfx10Total) - BHPosX) * 0.001147;
        dfy10new = ((yOrigin10 + dfy10Total) - BHPosY) * 0.001147;
        delta10New = sqrt(pow(dfx10new, 2) + pow(dfy10new, 2));
        //delta10New = MIN(.99, delta10New);
        deltaTheta10New = (sqrt((1 + cosf(delta10New)) / (1 - cosf(delta10New)))) * (1 / DBH);
        moveNode10x = (MIN(0.0, deltaTheta10New - deltaTheta10i) * (dfx10i / delta10i)) / .001147;
        moveNode10y = (MIN(0.0, deltaTheta10New - deltaTheta10i) * (dfy10i / delta10i)) / .001147;
        dfx10Total += moveNode10x;
        dfy10Total += moveNode10y;
        movement10 = [SKAction moveByX:moveNode10x y:moveNode10y duration:0.01];
        deltaTheta10i = MIN(deltaTheta10i, deltaTheta10New);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx11new = ((xOrigin11 + dfx11Total) - BHPosX) * 0.001147;
        dfy11new = ((yOrigin11 + dfy11Total) - BHPosY) * 0.001147;
        delta11New = sqrt(pow(dfx11new, 2) + pow(dfy11new, 2));
        //delta11New = MIN(.99, delta11New);
        deltaTheta11New = (sqrt((1 + cosf(delta11New)) / (1 - cosf(delta11New)))) * (1 / DBH);
        moveNode11x = (MIN(0.0, deltaTheta11New - deltaTheta11i) * (dfx11i / delta11i)) / .001147;
        moveNode11y = (MIN(0.0, deltaTheta11New - deltaTheta11i) * (dfy11i / delta11i)) / .001147;
        dfx11Total += moveNode11x;
        dfy11Total += moveNode11y;
        movement11 = [SKAction moveByX:moveNode11x y:moveNode11y duration:0.01];
        deltaTheta11i = MIN(deltaTheta11i, deltaTheta11New);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx12new = ((xOrigin12 + dfx12Total) - BHPosX) * 0.001147;
        dfy12new = ((yOrigin12 + dfy12Total) - BHPosY) * 0.001147;
        delta12New = sqrt(pow(dfx12new, 2) + pow(dfy12new, 2));
        //delta12New = MIN(.99, delta12New);
        deltaTheta12New = (sqrt((1 + cosf(delta12New)) / (1 - cosf(delta12New)))) * (1 / DBH);
        moveNode12x = (MIN(0.0, deltaTheta12New - deltaTheta12i) * (dfx12i / delta12i)) / .001147;
        moveNode12y = (MIN(0.0, deltaTheta12New - deltaTheta12i) * (dfy12i / delta12i)) / .001147;
        dfx12Total += moveNode12x;
        dfy12Total += moveNode12y;
        movement12 = [SKAction moveByX:moveNode12x y:moveNode12y duration:0.01];
        deltaTheta12i = MIN(deltaTheta12i, deltaTheta12New);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx13new = ((xOrigin13 + dfx13Total) - BHPosX) * 0.001147;
        dfy13new = ((yOrigin13 + dfy13Total) - BHPosY) * 0.001147;
        delta13New = sqrt(pow(dfx13new, 2) + pow(dfy13new, 2));
        //delta13New = MIN(.99, delta13New);
        deltaTheta13New = (sqrt((1 + cosf(delta13New)) / (1 - cosf(delta13New)))) * (1 / DBH);
        moveNode13x = (MIN(0.0, deltaTheta13New - deltaTheta13i) * (dfx13i / delta13i)) / .001147;
        moveNode13y = (MIN(0.0, deltaTheta13New - deltaTheta13i) * (dfy13i / delta13i)) / .001147;
        dfx13Total += moveNode13x;
        dfy13Total += moveNode13y;
        movement13 = [SKAction moveByX:moveNode13x y:moveNode13y duration:0.01];
        deltaTheta13i = MIN(deltaTheta13i, deltaTheta13New);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx14new = ((xOrigin14 + dfx14Total) - BHPosX) * 0.001147;
        dfy14new = ((yOrigin14 + dfy14Total) - BHPosY) * 0.001147;
        delta14New = sqrt(pow(dfx14new, 2) + pow(dfy14new, 2));
        //delta14New = MIN(.99, delta14New);
        deltaTheta14New = (sqrt((1 + cosf(delta14New)) / (1 - cosf(delta14New)))) * (1 / DBH);
        moveNode14x = (MIN(0.0, deltaTheta14New - deltaTheta14i) * (dfx14i / delta14i)) / .001147;
        moveNode14y = (MIN(0.0, deltaTheta14New - deltaTheta14i) * (dfy14i / delta14i)) / .001147;
        dfx14Total += moveNode14x;
        dfy14Total += moveNode14y;
        movement14 = [SKAction moveByX:moveNode14x y:moveNode14y duration:0.01];
        deltaTheta14i = MIN(deltaTheta14i, deltaTheta14New);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx15new = ((xOrigin15 + dfx15Total) - BHPosX) * 0.001147;
        dfy15new = ((yOrigin15 + dfy15Total) - BHPosY) * 0.001147;
        delta15New = sqrt(pow(dfx15new, 2) + pow(dfy15new, 2));
        //delta15New = MIN(.99, delta15New);
        deltaTheta15New = (sqrt((1 + cosf(delta15New)) / (1 - cosf(delta15New)))) * (1 / DBH);
        moveNode15x = (MIN(0.0, deltaTheta15New - deltaTheta15i) * (dfx15i / delta15i)) / .001147;
        moveNode15y = (MIN(0.0, deltaTheta15New - deltaTheta15i) * (dfy15i / delta15i)) / .001147;
        dfx15Total += moveNode15x;
        dfy15Total += moveNode15y;
        movement15 = [SKAction moveByX:moveNode15x y:moveNode15y duration:0.01];
        deltaTheta15i = MIN(deltaTheta15i, deltaTheta15New);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx16new = ((xOrigin16 + dfx16Total) - BHPosX) * 0.001147;
        dfy16new = ((yOrigin16 + dfy16Total) - BHPosY) * 0.001147;
        delta16New = sqrt(pow(dfx16new, 2) + pow(dfy16new, 2));
        //delta16New = MIN(.99, delta16New);
        deltaTheta16New = (sqrt((1 + cosf(delta16New)) / (1 - cosf(delta16New)))) * (1 / DBH);
        moveNode16x = (MIN(0.0, deltaTheta16New - deltaTheta16i) * (dfx16i / delta16i)) / .001147;
        moveNode16y = (MIN(0.0, deltaTheta16New - deltaTheta16i) * (dfy16i / delta16i)) / .001147;
        dfx16Total += moveNode16x;
        dfy16Total += moveNode16y;
        movement16 = [SKAction moveByX:moveNode16x y:moveNode16y duration:0.01];
        deltaTheta16i = MIN(deltaTheta16i, deltaTheta16New);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx17new = ((xOrigin17 + dfx17Total) - BHPosX) * 0.001147;
        dfy17new = ((yOrigin17 + dfy17Total) - BHPosY) * 0.001147;
        delta17New = sqrt(pow(dfx17new, 2) + pow(dfy17new, 2));
        //delta17New = MIN(.99, delta17New);
        deltaTheta17New = (sqrt((1 + cosf(delta17New)) / (1 - cosf(delta17New)))) * (1 / DBH);
        moveNode17x = (MIN(0.0, deltaTheta17New - deltaTheta17i) * (dfx17i / delta17i)) / .001147;
        moveNode17y = (MIN(0.0, deltaTheta17New - deltaTheta17i) * (dfy17i / delta17i)) / .001147;
        dfx17Total += moveNode17x;
        dfy17Total += moveNode17y;
        movement17 = [SKAction moveByX:moveNode17x y:moveNode17y duration:0.01];
        deltaTheta17i = MIN(deltaTheta17i, deltaTheta17New);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx18new = ((xOrigin18 + dfx18Total) - BHPosX) * 0.001147;
        dfy18new = ((yOrigin18 + dfy18Total) - BHPosY) * 0.001147;
        delta18New = sqrt(pow(dfx18new, 2) + pow(dfy18new, 2));
        //delta18New = MIN(.99, delta18New);
        deltaTheta18New = (sqrt((1 + cosf(delta18New)) / (1 - cosf(delta18New)))) * (1 / DBH);
        moveNode18x = (MIN(0.0, deltaTheta18New - deltaTheta18i) * (dfx18i / delta18i)) / .001147;
        moveNode18y = (MIN(0.0, deltaTheta18New - deltaTheta18i) * (dfy18i / delta18i)) / .001147;
        dfx18Total += moveNode18x;
        dfy18Total += moveNode18y;
        movement18 = [SKAction moveByX:moveNode18x y:moveNode18y duration:0.01];
        deltaTheta18i = MIN(deltaTheta18i, deltaTheta18New);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx19new = ((xOrigin19 + dfx19Total) - BHPosX) * 0.001147;
        dfy19new = ((yOrigin19 + dfy19Total) - BHPosY) * 0.001147;
        delta19New = sqrt(pow(dfx19new, 2) + pow(dfy19new, 2));
        //delta19New = MIN(.99, delta19New);
        deltaTheta19New = (sqrt((1 + cosf(delta19New)) / (1 - cosf(delta19New)))) * (1 / DBH);
        moveNode19x = (MIN(0.0, deltaTheta19New - deltaTheta19i) * (dfx19i / delta19i)) / .001147;
        moveNode19y = (MIN(0.0, deltaTheta19New - deltaTheta19i) * (dfy19i / delta19i)) / .001147;
        dfx19Total += moveNode19x;
        dfy19Total += moveNode19y;
        movement19 = [SKAction moveByX:moveNode19x y:moveNode19y duration:0.01];
        deltaTheta19i = MIN(deltaTheta19i, deltaTheta19New);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx20new = ((xOrigin20 + dfx20Total) - BHPosX) * 0.001147;
        dfy20new = ((yOrigin20 + dfy20Total) - BHPosY) * 0.001147;
        delta20New = sqrt(pow(dfx20new, 2) + pow(dfy20new, 2));
        //delta20New = MIN(.99, delta20New);
        deltaTheta20New = (sqrt((1 + cosf(delta20New)) / (1 - cosf(delta20New)))) * (1 / DBH);
        moveNode20x = (MIN(0.0, deltaTheta20New - deltaTheta20i) * (dfx20i / delta20i)) / .001147;
        moveNode20y = (MIN(0.0, deltaTheta20New - deltaTheta20i) * (dfy20i / delta20i)) / .001147;
        dfx20Total += moveNode20x;
        dfy20Total += moveNode20y;
        movement20 = [SKAction moveByX:moveNode20x y:moveNode20y duration:0.01];
        deltaTheta20i = MIN(deltaTheta20i, deltaTheta20New);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx21new = ((xOrigin21 + dfx21Total) - BHPosX) * 0.001147;
        dfy21new = ((yOrigin21 + dfy21Total) - BHPosY) * 0.001147;
        delta21New = sqrt(pow(dfx21new, 2) + pow(dfy21new, 2));
        //delta21New = MIN(.99, delta21New);
        deltaTheta21New = (sqrt((1 + cosf(delta21New)) / (1 - cosf(delta21New)))) * (1 / DBH);
        moveNode21x = (MIN(0.0, deltaTheta21New - deltaTheta21i) * (dfx21i / delta21i)) / .001147;
        moveNode21y = (MIN(0.0, deltaTheta21New - deltaTheta21i) * (dfy21i / delta21i)) / .001147;
        dfx21Total += moveNode21x;
        dfy21Total += moveNode21y;
        movement21 = [SKAction moveByX:moveNode21x y:moveNode21y duration:0.01];
        deltaTheta21i = MIN(deltaTheta21i, deltaTheta21New);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx22new = ((xOrigin22 + dfx22Total) - BHPosX) * 0.001147;
        dfy22new = ((yOrigin22 + dfy22Total) - BHPosY) * 0.001147;
        delta22New = sqrt(pow(dfx22new, 2) + pow(dfy22new, 2));
        //delta22New = MIN(.99, delta22New);
        deltaTheta22New = (sqrt((1 + cosf(delta22New)) / (1 - cosf(delta22New)))) * (1 / DBH);
        moveNode22x = (MIN(0.0, deltaTheta22New - deltaTheta22i) * (dfx22i / delta22i)) / .001147;
        moveNode22y = (MIN(0.0, deltaTheta22New - deltaTheta22i) * (dfy22i / delta22i)) / .001147;
        dfx22Total += moveNode22x;
        dfy22Total += moveNode22y;
        movement22 = [SKAction moveByX:moveNode22x y:moveNode22y duration:0.01];
        deltaTheta22i = MIN(deltaTheta22i, deltaTheta22New);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx23new = ((xOrigin23 + dfx23Total) - BHPosX) * 0.001147;
        dfy23new = ((yOrigin23 + dfy23Total) - BHPosY) * 0.001147;
        delta23New = sqrt(pow(dfx23new, 2) + pow(dfy23new, 2));
        //delta23New = MIN(.99, delta23New);
        deltaTheta23New = (sqrt((1 + cosf(delta23New)) / (1 - cosf(delta23New)))) * (1 / DBH);
        moveNode23x = (MIN(0.0, deltaTheta23New - deltaTheta23i) * (dfx23i / delta23i)) / .001147;
        moveNode23y = (MIN(0.0, deltaTheta23New - deltaTheta23i) * (dfy23i / delta23i)) / .001147;
        dfx23Total += moveNode23x;
        dfy23Total += moveNode23y;
        movement23 = [SKAction moveByX:moveNode23x y:moveNode23y duration:0.01];
        deltaTheta23i = MIN(deltaTheta23i, deltaTheta23New);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx24new = ((xOrigin24 + dfx24Total) - BHPosX) * 0.001147;
        dfy24new = ((yOrigin24 + dfy24Total) - BHPosY) * 0.001147;
        delta24New = sqrt(pow(dfx24new, 2) + pow(dfy24new, 2));
        //delta24New = MIN(.99, delta24New);
        deltaTheta24New = (sqrt((1 + cosf(delta24New)) / (1 - cosf(delta24New)))) * (1 / DBH);
        moveNode24x = (MIN(0.0, deltaTheta24New - deltaTheta24i) * (dfx24i / delta24i)) / .001147;
        moveNode24y = (MIN(0.0, deltaTheta24New - deltaTheta24i) * (dfy24i / delta24i)) / .001147;
        dfx24Total += moveNode24x;
        dfy24Total += moveNode24y;
        movement24 = [SKAction moveByX:moveNode24x y:moveNode24y duration:0.01];
        deltaTheta24i = MIN(deltaTheta24i, deltaTheta24New);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx25new = ((xOrigin25 + dfx25Total) - BHPosX) * 0.001147;
        dfy25new = ((yOrigin25 + dfy25Total) - BHPosY) * 0.001147;
        delta25New = sqrt(pow(dfx25new, 2) + pow(dfy25new, 2));
        //delta25New = MIN(.99, delta25New);
        deltaTheta25New = (sqrt((1 + cosf(delta25New)) / (1 - cosf(delta25New)))) * (1 / DBH);
        moveNode25x = (MIN(0.0, deltaTheta25New - deltaTheta25i) * (dfx25i / delta25i)) / .001147;
        moveNode25y = (MIN(0.0, deltaTheta25New - deltaTheta25i) * (dfy25i / delta25i)) / .001147;
        dfx25Total += moveNode25x;
        dfy25Total += moveNode25y;
        movement25 = [SKAction moveByX:moveNode25x y:moveNode25y duration:0.01];
        deltaTheta25i = MIN(deltaTheta25i, deltaTheta25New);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx26new = ((xOrigin26 + dfx26Total) - BHPosX) * 0.001147;
        dfy26new = ((yOrigin26 + dfy26Total) - BHPosY) * 0.001147;
        delta26New = sqrt(pow(dfx26new, 2) + pow(dfy26new, 2));
        //delta26New = MIN(.99, delta26New);
        deltaTheta26New = (sqrt((1 + cosf(delta26New)) / (1 - cosf(delta26New)))) * (1 / DBH);
        moveNode26x = (MIN(0.0, deltaTheta26New - deltaTheta26i) * (dfx26i / delta26i)) / .001147;
        moveNode26y = (MIN(0.0, deltaTheta26New - deltaTheta26i) * (dfy26i / delta26i)) / .001147;
        dfx26Total += moveNode26x;
        dfy26Total += moveNode26y;
        movement26 = [SKAction moveByX:moveNode26x y:moveNode26y duration:0.01];
        deltaTheta26i = MIN(deltaTheta26i, deltaTheta26New);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx27new = ((xOrigin27 + dfx27Total) - BHPosX) * 0.001147;
        dfy27new = ((yOrigin27 + dfy27Total) - BHPosY) * 0.001147;
        delta27New = sqrt(pow(dfx27new, 2) + pow(dfy27new, 2));
        //delta27New = MIN(.99, delta27New);
        deltaTheta27New = (sqrt((1 + cosf(delta27New)) / (1 - cosf(delta27New)))) * (1 / DBH);
        moveNode27x = (MIN(0.0, deltaTheta27New - deltaTheta27i) * (dfx27i / delta27i)) / .001147;
        moveNode27y = (MIN(0.0, deltaTheta27New - deltaTheta27i) * (dfy27i / delta27i)) / .001147;
        dfx27Total += moveNode27x;
        dfy27Total += moveNode27y;
        movement27 = [SKAction moveByX:moveNode27x y:moveNode27y duration:0.01];
        deltaTheta27i = MIN(deltaTheta27i, deltaTheta27New);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx28new = ((xOrigin28 + dfx28Total) - BHPosX) * 0.001147;
        dfy28new = ((yOrigin28 + dfy28Total) - BHPosY) * 0.001147;
        delta28New = sqrt(pow(dfx28new, 2) + pow(dfy28new, 2));
        //delta28New = MIN(.99, delta28New);
        deltaTheta28New = (sqrt((1 + cosf(delta28New)) / (1 - cosf(delta28New)))) * (1 / DBH);
        moveNode28x = (MIN(0.0, deltaTheta28New - deltaTheta28i) * (dfx28i / delta28i)) / .001147;
        moveNode28y = (MIN(0.0, deltaTheta28New - deltaTheta28i) * (dfy28i / delta28i)) / .001147;
        dfx28Total += moveNode28x;
        dfy28Total += moveNode28y;
        movement28 = [SKAction moveByX:moveNode28x y:moveNode28y duration:0.01];
        deltaTheta28i = MIN(deltaTheta28i, deltaTheta28New);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx29new = ((xOrigin29 + dfx29Total) - BHPosX) * 0.001147;
        dfy29new = ((yOrigin29 + dfy29Total) - BHPosY) * 0.001147;
        delta29New = sqrt(pow(dfx29new, 2) + pow(dfy29new, 2));
        //delta29New = MIN(.99, delta29New);
        deltaTheta29New = (sqrt((1 + cosf(delta29New)) / (1 - cosf(delta29New)))) * (1 / DBH);
        moveNode29x = (MIN(0.0, deltaTheta29New - deltaTheta29i) * (dfx29i / delta29i)) / .001147;
        moveNode29y = (MIN(0.0, deltaTheta29New - deltaTheta29i) * (dfy29i / delta29i)) / .001147;
        dfx29Total += moveNode29x;
        dfy29Total += moveNode29y;
        movement29 = [SKAction moveByX:moveNode29x y:moveNode29y duration:0.01];
        deltaTheta29i = MIN(deltaTheta29i, deltaTheta29New);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx30new = ((xOrigin30 + dfx30Total) - BHPosX) * 0.001147;
        dfy30new = ((yOrigin30 + dfy30Total) - BHPosY) * 0.001147;
        delta30New = sqrt(pow(dfx30new, 2) + pow(dfy30new, 2));
        //delta30New = MIN(.99, delta30New);
        deltaTheta30New = (sqrt((1 + cosf(delta30New)) / (1 - cosf(delta30New)))) * (1 / DBH);
        moveNode30x = (MIN(0.0, deltaTheta30New - deltaTheta30i) * (dfx30i / delta30i)) / .001147;
        moveNode30y = (MIN(0.0, deltaTheta30New - deltaTheta30i) * (dfy30i / delta30i)) / .001147;
        dfx30Total += moveNode30x;
        dfy30Total += moveNode30y;
        movement30 = [SKAction moveByX:moveNode30x y:moveNode30y duration:0.01];
        deltaTheta30i = MIN(deltaTheta30i, deltaTheta30New);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx31new = ((xOrigin31 + dfx31Total) - BHPosX) * 0.001147;
        dfy31new = ((yOrigin31 + dfy31Total) - BHPosY) * 0.001147;
        delta31New = sqrt(pow(dfx31new, 2) + pow(dfy31new, 2));
        //delta31New = MIN(.99, delta31New);
        deltaTheta31New = (sqrt((1 + cosf(delta31New)) / (1 - cosf(delta31New)))) * (1 / DBH);
        moveNode31x = (MIN(0.0, deltaTheta31New - deltaTheta31i) * (dfx31i / delta31i)) / .001147;
        moveNode31y = (MIN(0.0, deltaTheta31New - deltaTheta31i) * (dfy31i / delta31i)) / .001147;
        dfx31Total += moveNode31x;
        dfy31Total += moveNode31y;
        movement31 = [SKAction moveByX:moveNode31x y:moveNode31y duration:0.01];
        deltaTheta31i = MIN(deltaTheta31i, deltaTheta31New);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx32new = ((xOrigin32 + dfx32Total) - BHPosX) * 0.001147;
        dfy32new = ((yOrigin32 + dfy32Total) - BHPosY) * 0.001147;
        delta32New = sqrt(pow(dfx32new, 2) + pow(dfy32new, 2));
        //delta32New = MIN(.99, delta32New);
        deltaTheta32New = (sqrt((1 + cosf(delta32New)) / (1 - cosf(delta32New)))) * (1 / DBH);
        moveNode32x = (MIN(0.0, deltaTheta32New - deltaTheta32i) * (dfx32i / delta32i)) / .001147;
        moveNode32y = (MIN(0.0, deltaTheta32New - deltaTheta32i) * (dfy32i / delta32i)) / .001147;
        dfx32Total += moveNode32x;
        dfy32Total += moveNode32y;
        movement32 = [SKAction moveByX:moveNode32x y:moveNode32y duration:0.01];
        deltaTheta32i = MIN(deltaTheta32i, deltaTheta32New);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx33new = ((xOrigin33 + dfx33Total) - BHPosX) * 0.001147;
        dfy33new = ((yOrigin33 + dfy33Total) - BHPosY) * 0.001147;
        delta33New = sqrt(pow(dfx33new, 2) + pow(dfy33new, 2));
        //delta33New = MIN(.99, delta33New);
        deltaTheta33New = (sqrt((1 + cosf(delta33New)) / (1 - cosf(delta33New)))) * (1 / DBH);
        moveNode33x = (MIN(0.0, deltaTheta33New - deltaTheta33i) * (dfx33i / delta33i)) / .001147;
        moveNode33y = (MIN(0.0, deltaTheta33New - deltaTheta33i) * (dfy33i / delta33i)) / .001147;
        dfx33Total += moveNode33x;
        dfy33Total += moveNode33y;
        movement33 = [SKAction moveByX:moveNode33x y:moveNode33y duration:0.01];
        deltaTheta33i = MIN(deltaTheta33i, deltaTheta33New);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx34new = ((xOrigin34 + dfx34Total) - BHPosX) * 0.001147;
        dfy34new = ((yOrigin34 + dfy34Total) - BHPosY) * 0.001147;
        delta34New = sqrt(pow(dfx34new, 2) + pow(dfy34new, 2));
        //delta34New = MIN(.99, delta34New);
        deltaTheta34New = (sqrt((1 + cosf(delta34New)) / (1 - cosf(delta34New)))) * (1 / DBH);
        moveNode34x = (MIN(0.0, deltaTheta34New - deltaTheta34i) * (dfx34i / delta34i)) / .001147;
        moveNode34y = (MIN(0.0, deltaTheta34New - deltaTheta34i) * (dfy34i / delta34i)) / .001147;
        dfx34Total += moveNode34x;
        dfy34Total += moveNode34y;
        movement34 = [SKAction moveByX:moveNode34x y:moveNode34y duration:0.01];
        deltaTheta34i = MIN(deltaTheta34i, deltaTheta34New);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx35new = ((xOrigin35 + dfx35Total) - BHPosX) * 0.001147;
        dfy35new = ((yOrigin35 + dfy35Total) - BHPosY) * 0.001147;
        delta35New = sqrt(pow(dfx35new, 2) + pow(dfy35new, 2));
        //delta35New = MIN(.99, delta35New);
        deltaTheta35New = (sqrt((1 + cosf(delta35New)) / (1 - cosf(delta35New)))) * (1 / DBH);
        moveNode35x = (MIN(0.0, deltaTheta35New - deltaTheta35i) * (dfx35i / delta35i)) / .001147;
        moveNode35y = (MIN(0.0, deltaTheta35New - deltaTheta35i) * (dfy35i / delta35i)) / .001147;
        dfx35Total += moveNode35x;
        dfy35Total += moveNode35y;
        movement35 = [SKAction moveByX:moveNode35x y:moveNode35y duration:0.01];
        deltaTheta35i = MIN(deltaTheta35i, deltaTheta35New);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx36new = ((xOrigin36 + dfx36Total) - BHPosX) * 0.001147;
        dfy36new = ((yOrigin36 + dfy36Total) - BHPosY) * 0.001147;
        delta36New = sqrt(pow(dfx36new, 2) + pow(dfy36new, 2));
        //delta36New = MIN(.99, delta36New);
        deltaTheta36New = (sqrt((1 + cosf(delta36New)) / (1 - cosf(delta36New)))) * (1 / DBH);
        moveNode36x = (MIN(0.0, deltaTheta36New - deltaTheta36i) * (dfx36i / delta36i)) / .001147;
        moveNode36y = (MIN(0.0, deltaTheta36New - deltaTheta36i) * (dfy36i / delta36i)) / .001147;
        dfx36Total += moveNode36x;
        dfy36Total += moveNode36y;
        movement36 = [SKAction moveByX:moveNode36x y:moveNode36y duration:0.01];
        deltaTheta36i = MIN(deltaTheta36i, deltaTheta36New);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx37new = ((xOrigin37 + dfx37Total) - BHPosX) * 0.001147;
        dfy37new = ((yOrigin37 + dfy37Total) - BHPosY) * 0.001147;
        delta37New = sqrt(pow(dfx37new, 2) + pow(dfy37new, 2));
        //delta37New = MIN(.99, delta37New);
        deltaTheta37New = (sqrt((1 + cosf(delta37New)) / (1 - cosf(delta37New)))) * (1 / DBH);
        moveNode37x = (MIN(0.0, deltaTheta37New - deltaTheta37i) * (dfx37i / delta37i)) / .001147;
        moveNode37y = (MIN(0.0, deltaTheta37New - deltaTheta37i) * (dfy37i / delta37i)) / .001147;
        dfx37Total += moveNode37x;
        dfy37Total += moveNode37y;
        movement37 = [SKAction moveByX:moveNode37x y:moveNode37y duration:0.01];
        deltaTheta37i = MIN(deltaTheta37i, deltaTheta37New);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx38new = ((xOrigin38 + dfx38Total) - BHPosX) * 0.001147;
        dfy38new = ((yOrigin38 + dfy38Total) - BHPosY) * 0.001147;
        delta38New = sqrt(pow(dfx38new, 2) + pow(dfy38new, 2));
        //delta38New = MIN(.99, delta38New);
        deltaTheta38New = (sqrt((1 + cosf(delta38New)) / (1 - cosf(delta38New)))) * (1 / DBH);
        moveNode38x = (MIN(0.0, deltaTheta38New - deltaTheta38i) * (dfx38i / delta38i)) / .001147;
        moveNode38y = (MIN(0.0, deltaTheta38New - deltaTheta38i) * (dfy38i / delta38i)) / .001147;
        dfx38Total += moveNode38x;
        dfy38Total += moveNode38y;
        movement38 = [SKAction moveByX:moveNode38x y:moveNode38y duration:0.01];
        deltaTheta38i = MIN(deltaTheta38i, deltaTheta38New);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx39new = ((xOrigin39 + dfx39Total) - BHPosX) * 0.001147;
        dfy39new = ((yOrigin39 + dfy39Total) - BHPosY) * 0.001147;
        delta39New = sqrt(pow(dfx39new, 2) + pow(dfy39new, 2));
        //delta39New = MIN(.99, delta39New);
        deltaTheta39New = (sqrt((1 + cosf(delta39New)) / (1 - cosf(delta39New)))) * (1 / DBH);
        moveNode39x = (MIN(0.0, deltaTheta39New - deltaTheta39i) * (dfx39i / delta39i)) / .001147;
        moveNode39y = (MIN(0.0, deltaTheta39New - deltaTheta39i) * (dfy39i / delta39i)) / .001147;
        dfx39Total += moveNode39x;
        dfy39Total += moveNode39y;
        movement39 = [SKAction moveByX:moveNode39x y:moveNode39y duration:0.01];
        deltaTheta39i = MIN(deltaTheta39i, deltaTheta39New);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx40new = ((xOrigin40 + dfx40Total) - BHPosX) * 0.001147;
        dfy40new = ((yOrigin40 + dfy40Total) - BHPosY) * 0.001147;
        delta40New = sqrt(pow(dfx40new, 2) + pow(dfy40new, 2));
        //delta40New = MIN(.99, delta40New);
        deltaTheta40New = (sqrt((1 + cosf(delta40New)) / (1 - cosf(delta40New)))) * (1 / DBH);
        moveNode40x = (MIN(0.0, deltaTheta40New - deltaTheta40i) * (dfx40i / delta40i)) / .001147;
        moveNode40y = (MIN(0.0, deltaTheta40New - deltaTheta40i) * (dfy40i / delta40i)) / .001147;
        dfx40Total += moveNode40x;
        dfy40Total += moveNode40y;
        movement40 = [SKAction moveByX:moveNode40x y:moveNode40y duration:0.01];
        deltaTheta40i = MIN(deltaTheta40i, deltaTheta40New);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx41new = ((xOrigin41 + dfx41Total) - BHPosX) * 0.001147;
        dfy41new = ((yOrigin41 + dfy41Total) - BHPosY) * 0.001147;
        delta41New = sqrt(pow(dfx41new, 2) + pow(dfy41new, 2));
        //delta41New = MIN(.99, delta41New);
        deltaTheta41New = (sqrt((1 + cosf(delta41New)) / (1 - cosf(delta41New)))) * (1 / DBH);
        moveNode41x = (MIN(0.0, deltaTheta41New - deltaTheta41i) * (dfx41i / delta41i)) / .001147;
        moveNode41y = (MIN(0.0, deltaTheta41New - deltaTheta41i) * (dfy41i / delta41i)) / .001147;
        dfx41Total += moveNode41x;
        dfy41Total += moveNode41y;
        movement41 = [SKAction moveByX:moveNode41x y:moveNode41y duration:0.01];
        deltaTheta41i = MIN(deltaTheta41i, deltaTheta41New);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx42new = ((xOrigin42 + dfx42Total) - BHPosX) * 0.001147;
        dfy42new = ((yOrigin42 + dfy42Total) - BHPosY) * 0.001147;
        delta42New = sqrt(pow(dfx42new, 2) + pow(dfy42new, 2));
        //delta42New = MIN(.99, delta42New);
        deltaTheta42New = (sqrt((1 + cosf(delta42New)) / (1 - cosf(delta42New)))) * (1 / DBH);
        moveNode42x = (MIN(0.0, deltaTheta42New - deltaTheta42i) * (dfx42i / delta42i)) / .001147;
        moveNode42y = (MIN(0.0, deltaTheta42New - deltaTheta42i) * (dfy42i / delta42i)) / .001147;
        dfx42Total += moveNode42x;
        dfy42Total += moveNode42y;
        movement42 = [SKAction moveByX:moveNode42x y:moveNode42y duration:0.01];
        deltaTheta42i = MIN(deltaTheta42i, deltaTheta42New);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx43new = ((xOrigin43 + dfx43Total) - BHPosX) * 0.001147;
        dfy43new = ((yOrigin43 + dfy43Total) - BHPosY) * 0.001147;
        delta43New = sqrt(pow(dfx43new, 2) + pow(dfy43new, 2));
        //delta43New = MIN(.99, delta43New);
        deltaTheta43New = (sqrt((1 + cosf(delta43New)) / (1 - cosf(delta43New)))) * (1 / DBH);
        moveNode43x = (MIN(0.0, deltaTheta43New - deltaTheta43i) * (dfx43i / delta43i)) / .001147;
        moveNode43y = (MIN(0.0, deltaTheta43New - deltaTheta43i) * (dfy43i / delta43i)) / .001147;
        dfx43Total += moveNode43x;
        dfy43Total += moveNode43y;
        movement43 = [SKAction moveByX:moveNode43x y:moveNode43y duration:0.01];
        deltaTheta43i = MIN(deltaTheta43i, deltaTheta43New);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx44new = ((xOrigin44 + dfx44Total) - BHPosX) * 0.001147;
        dfy44new = ((yOrigin44 + dfy44Total) - BHPosY) * 0.001147;
        delta44New = sqrt(pow(dfx44new, 2) + pow(dfy44new, 2));
        //delta44New = MIN(.99, delta44New);
        deltaTheta44New = (sqrt((1 + cosf(delta44New)) / (1 - cosf(delta44New)))) * (1 / DBH);
        moveNode44x = (MIN(0.0, deltaTheta44New - deltaTheta44i) * (dfx44i / delta44i)) / .001147;
        moveNode44y = (MIN(0.0, deltaTheta44New - deltaTheta44i) * (dfy44i / delta44i)) / .001147;
        dfx44Total += moveNode44x;
        dfy44Total += moveNode44y;
        movement44 = [SKAction moveByX:moveNode44x y:moveNode44y duration:0.01];
        deltaTheta44i = MIN(deltaTheta44i, deltaTheta44New);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx45new = ((xOrigin45 + dfx45Total) - BHPosX) * 0.001147;
        dfy45new = ((yOrigin45 + dfy45Total) - BHPosY) * 0.001147;
        delta45New = sqrt(pow(dfx45new, 2) + pow(dfy45new, 2));
        //delta45New = MIN(.99, delta45New);
        deltaTheta45New = (sqrt((1 + cosf(delta45New)) / (1 - cosf(delta45New)))) * (1 / DBH);
        moveNode45x = (MIN(0.0, deltaTheta45New - deltaTheta45i) * (dfx45i / delta45i)) / .001147;
        moveNode45y = (MIN(0.0, deltaTheta45New - deltaTheta45i) * (dfy45i / delta45i)) / .001147;
        dfx45Total += moveNode45x;
        dfy45Total += moveNode45y;
        movement45 = [SKAction moveByX:moveNode45x y:moveNode45y duration:0.01];
        deltaTheta45i = MIN(deltaTheta45i, deltaTheta45New);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx46new = ((xOrigin46 + dfx46Total) - BHPosX) * 0.001147;
        dfy46new = ((yOrigin46 + dfy46Total) - BHPosY) * 0.001147;
        delta46New = sqrt(pow(dfx46new, 2) + pow(dfy46new, 2));
        //delta46New = MIN(.99, delta46New);
        deltaTheta46New = (sqrt((1 + cosf(delta46New)) / (1 - cosf(delta46New)))) * (1 / DBH);
        moveNode46x = (MIN(0.0, deltaTheta46New - deltaTheta46i) * (dfx46i / delta46i)) / .001147;
        moveNode46y = (MIN(0.0, deltaTheta46New - deltaTheta46i) * (dfy46i / delta46i)) / .001147;
        dfx46Total += moveNode46x;
        dfy46Total += moveNode46y;
        movement46 = [SKAction moveByX:moveNode46x y:moveNode46y duration:0.01];
        deltaTheta46i = MIN(deltaTheta46i, deltaTheta46New);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx47new = ((xOrigin47 + dfx47Total) - BHPosX) * 0.001147;
        dfy47new = ((yOrigin47 + dfy47Total) - BHPosY) * 0.001147;
        delta47New = sqrt(pow(dfx47new, 2) + pow(dfy47new, 2));
        //delta47New = MIN(.99, delta47New);
        deltaTheta47New = (sqrt((1 + cosf(delta47New)) / (1 - cosf(delta47New)))) * (1 / DBH);
        moveNode47x = (MIN(0.0, deltaTheta47New - deltaTheta47i) * (dfx47i / delta47i)) / .001147;
        moveNode47y = (MIN(0.0, deltaTheta47New - deltaTheta47i) * (dfy47i / delta47i)) / .001147;
        dfx47Total += moveNode47x;
        dfy47Total += moveNode47y;
        movement47 = [SKAction moveByX:moveNode47x y:moveNode47y duration:0.01];
        deltaTheta47i = MIN(deltaTheta47i, deltaTheta47New);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //Ambient stars
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx1newa = ((xOrigin1a + dfx1Totala) - BHPosX) * 0.001147;
        dfy1newa = ((yOrigin1a + dfy1Totala) - BHPosY) * 0.001147;
        delta1Newa = sqrt(pow(dfx1newa, 2) + pow(dfy1newa, 2));
        //delta1Newa = MIN(.99, delta1Newa);
        deltaTheta1Newa = (sqrt((1 + cosf(delta1Newa)) / (1 - cosf(delta1Newa)))) * (1 / DBH);
        moveNode1xa = (MIN(0.0, deltaTheta1Newa - deltaTheta1ia) * (dfx1ia / delta1ia)) / .001147;
        moveNode1ya = (MIN(0.0, deltaTheta1Newa - deltaTheta1ia) * (dfy1ia / delta1ia)) / .001147;
        dfx1Totala += moveNode1xa;
        dfy1Totala += moveNode1ya;
        movement1a = [SKAction moveByX:moveNode1xa y:moveNode1ya duration:0.01];
        deltaTheta1ia = MIN(deltaTheta1ia, deltaTheta1Newa);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx2newa = ((xOrigin2a + dfx2Totala) - BHPosX) * 0.001147;
        dfy2newa = ((yOrigin2a + dfy2Totala) - BHPosY) * 0.001147;
        delta2Newa = sqrt(pow(dfx2newa, 2) + pow(dfy2newa, 2));
        //delta2Newa = MIN(.99, delta2Newa);
        deltaTheta2Newa = (sqrt((1 + cosf(delta2Newa)) / (1 - cosf(delta2Newa)))) * (1 / DBH);
        moveNode2xa = (MIN(0.0, deltaTheta2Newa - deltaTheta2ia) * (dfx2ia / delta2ia)) / .001147;
        moveNode2ya = (MIN(0.0, deltaTheta2Newa - deltaTheta2ia) * (dfy2ia / delta2ia)) / .001147;
        dfx2Totala += moveNode2xa;
        dfy2Totala += moveNode2ya;
        movement2a = [SKAction moveByX:moveNode2xa y:moveNode2ya duration:0.01];
        deltaTheta2ia = MIN(deltaTheta2ia, deltaTheta2Newa);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx3newa = ((xOrigin3a + dfx3Totala) - BHPosX) * 0.001147;
        dfy3newa = ((yOrigin3a + dfy3Totala) - BHPosY) * 0.001147;
        delta3Newa = sqrt(pow(dfx3newa, 2) + pow(dfy3newa, 2));
        //delta3Newa = MIN(.99, delta3New);
        deltaTheta3Newa = (sqrt((1 + cosf(delta3Newa)) / (1 - cosf(delta3Newa)))) * (1 / DBH);
        moveNode3xa = (MIN(0.0, deltaTheta3Newa - deltaTheta3ia) * (dfx3ia / delta3ia)) / .001147;
        moveNode3ya = (MIN(0.0, deltaTheta3Newa - deltaTheta3ia) * (dfy3ia / delta3ia)) / .001147;
        dfx3Totala += moveNode3xa;
        dfy3Totala += moveNode3ya;
        movement3a = [SKAction moveByX:moveNode3xa y:moveNode3ya duration:0.01];
        deltaTheta3ia = MIN(deltaTheta3ia, deltaTheta3Newa);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx4newa = ((xOrigin4a + dfx4Totala) - BHPosX) * 0.001147;
        dfy4newa = ((yOrigin4a + dfy4Totala) - BHPosY) * 0.001147;
        delta4Newa = sqrt(pow(dfx4newa, 2) + pow(dfy4newa, 2));
        //delta4Newa = MIN(.99, delta4Newa);
        deltaTheta4Newa = (sqrt((1 + cosf(delta4Newa)) / (1 - cosf(delta4Newa)))) * (1 / DBH);
        moveNode4xa = (MIN(0.0, deltaTheta4Newa - deltaTheta4ia) * (dfx4ia / delta4ia)) / .001147;
        moveNode4ya = (MIN(0.0, deltaTheta4Newa - deltaTheta4ia) * (dfy4ia / delta4ia)) / .001147;
        dfx4Totala += moveNode4xa;
        dfy4Totala += moveNode4ya;
        movement4a = [SKAction moveByX:moveNode4xa y:moveNode4ya duration:0.01];
        deltaTheta4ia = MIN(deltaTheta4ia, deltaTheta4Newa);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx5newa = ((xOrigin5a + dfx5Totala) - BHPosX) * 0.001147;
        dfy5newa = ((yOrigin5a + dfy5Totala) - BHPosY) * 0.001147;
        delta5Newa = sqrt(pow(dfx5newa, 2) + pow(dfy5newa, 2));
        //delta5Newa = MIN(.99, delta5Newa);
        deltaTheta5Newa = (sqrt((1 + cosf(delta5Newa)) / (1 - cosf(delta5Newa)))) * (1 / DBH);
        moveNode5xa = (MIN(0.0, deltaTheta5Newa - deltaTheta5ia) * (dfx5ia / delta5ia)) / .001147;
        moveNode5ya = (MIN(0.0, deltaTheta5Newa - deltaTheta5ia) * (dfy5ia / delta5ia)) / .001147;
        dfx5Totala += moveNode5xa;
        dfy5Totala += moveNode5ya;
        movement5a = [SKAction moveByX:moveNode5xa y:moveNode5ya duration:0.01];
        deltaTheta5ia = MIN(deltaTheta5ia, deltaTheta5Newa);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx6newa = ((xOrigin6a + dfx6Totala) - BHPosX) * 0.001147;
        dfy6newa = ((yOrigin6a + dfy6Totala) - BHPosY) * 0.001147;
        delta6Newa = sqrt(pow(dfx6newa, 2) + pow(dfy6newa, 2));
        //delta6Newa = MIN(.99, delta6Newa);
        deltaTheta6Newa = (sqrt((1 + cosf(delta6Newa)) / (1 - cosf(delta6Newa)))) * (1 / DBH);
        moveNode6xa = (MIN(0.0, deltaTheta6Newa - deltaTheta6ia) * (dfx6ia / delta6ia)) / .001147;
        moveNode6ya = (MIN(0.0, deltaTheta6Newa - deltaTheta6ia) * (dfy6ia / delta6ia)) / .001147;
        dfx6Totala += moveNode6xa;
        dfy6Totala += moveNode6ya;
        movement6a = [SKAction moveByX:moveNode6xa y:moveNode6ya duration:0.01];
        deltaTheta6ia = MIN(deltaTheta6ia, deltaTheta6Newa);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx7newa = ((xOrigin7a + dfx7Totala) - BHPosX) * 0.001147;
        dfy7newa = ((yOrigin7a + dfy7Totala) - BHPosY) * 0.001147;
        delta7Newa = sqrt(pow(dfx7newa, 2) + pow(dfy7newa, 2));
        //delta7Newa = MIN(.99, delta7Newa);
        deltaTheta7Newa = (sqrt((1 + cosf(delta7Newa)) / (1 - cosf(delta7Newa)))) * (1 / DBH);
        moveNode7xa = (MIN(0.0, deltaTheta7Newa - deltaTheta7ia) * (dfx7ia / delta7ia)) / .001147;
        moveNode7ya = (MIN(0.0, deltaTheta7Newa - deltaTheta7ia) * (dfy7ia / delta7ia)) / .001147;
        dfx7Totala += moveNode7xa;
        dfy7Totala += moveNode7ya;
        movement7a = [SKAction moveByX:moveNode7xa y:moveNode7ya duration:0.01];
        deltaTheta7ia = MIN(deltaTheta7ia, deltaTheta7Newa);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx8newa = ((xOrigin8a + dfx8Totala) - BHPosX) * 0.001147;
        dfy8newa = ((yOrigin8a + dfy8Totala) - BHPosY) * 0.001147;
        delta8Newa = sqrt(pow(dfx8newa, 2) + pow(dfy8newa, 2));
        //delta8Newa = MIN(.99, delta8New);
        deltaTheta8Newa = (sqrt((1 + cosf(delta8Newa)) / (1 - cosf(delta8Newa)))) * (1 / DBH);
        moveNode8xa = (MIN(0.0, deltaTheta8Newa - deltaTheta8ia) * (dfx8ia / delta8ia)) / .001147;
        moveNode8ya = (MIN(0.0, deltaTheta8Newa - deltaTheta8ia) * (dfy8ia / delta8ia)) / .001147;
        dfx8Totala += moveNode8xa;
        dfy8Totala += moveNode8ya;
        movement8a = [SKAction moveByX:moveNode8xa y:moveNode8ya duration:0.01];
        deltaTheta8ia = MIN(deltaTheta8ia, deltaTheta8Newa);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx9newa = ((xOrigin9a + dfx9Totala) - BHPosX) * 0.001147;
        dfy9newa = ((yOrigin9a + dfy9Totala) - BHPosY) * 0.001147;
        delta9Newa = sqrt(pow(dfx9newa, 2) + pow(dfy9newa, 2));
        //delta9Newa = MIN(.99, delta9Newa);
        deltaTheta9Newa = (sqrt((1 + cosf(delta9Newa)) / (1 - cosf(delta9Newa)))) * (1 / DBH);
        moveNode9xa = (MIN(0.0, deltaTheta9Newa - deltaTheta9ia) * (dfx9ia / delta9ia)) / .001147;
        moveNode9ya = (MIN(0.0, deltaTheta9Newa - deltaTheta9ia) * (dfy9ia / delta9ia)) / .001147;
        dfx9Totala += moveNode9xa;
        dfy9Totala += moveNode9ya;
        movement9a = [SKAction moveByX:moveNode9xa y:moveNode9ya duration:0.01];
        deltaTheta9ia = MIN(deltaTheta9ia, deltaTheta9Newa);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx10newa = ((xOrigin10a + dfx10Totala) - BHPosX) * 0.001147;
        dfy10newa = ((yOrigin10a + dfy10Totala) - BHPosY) * 0.001147;
        delta10Newa = sqrt(pow(dfx10newa, 2) + pow(dfy10newa, 2));
        //delta10Newa = MIN(.99, delta10Newa);
        deltaTheta10Newa = (sqrt((1 + cosf(delta10Newa)) / (1 - cosf(delta10Newa)))) * (1 / DBH);
        moveNode10xa = (MIN(0.0, deltaTheta10Newa - deltaTheta10ia) * (dfx10ia / delta10ia)) / .001147;
        moveNode10ya = (MIN(0.0, deltaTheta10Newa - deltaTheta10ia) * (dfy10ia / delta10ia)) / .001147;
        dfx10Totala += moveNode10xa;
        dfy10Totala += moveNode10ya;
        movement10a = [SKAction moveByX:moveNode10xa y:moveNode10ya duration:0.01];
        deltaTheta10ia = MIN(deltaTheta10ia, deltaTheta10Newa);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx11newa = ((xOrigin11a + dfx11Totala) - BHPosX) * 0.001147;
        dfy11newa = ((yOrigin11a + dfy11Totala) - BHPosY) * 0.001147;
        delta11Newa = sqrt(pow(dfx11newa, 2) + pow(dfy11newa, 2));
        //delta11Newa = MIN(.99, delta11Newa);
        deltaTheta11Newa = (sqrt((1 + cosf(delta11Newa)) / (1 - cosf(delta11Newa)))) * (1 / DBH);
        moveNode11xa = (MIN(0.0, deltaTheta11Newa - deltaTheta11ia) * (dfx11ia / delta11ia)) / .001147;
        moveNode11ya = (MIN(0.0, deltaTheta11Newa - deltaTheta11ia) * (dfy11ia / delta11ia)) / .001147;
        dfx11Totala += moveNode11xa;
        dfy11Totala += moveNode11ya;
        movement11a = [SKAction moveByX:moveNode11xa y:moveNode11ya duration:0.01];
        deltaTheta11ia = MIN(deltaTheta11ia, deltaTheta11Newa);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx12newa = ((xOrigin12a + dfx12Totala) - BHPosX) * 0.001147;
        dfy12newa = ((yOrigin12a + dfy12Totala) - BHPosY) * 0.001147;
        delta12Newa = sqrt(pow(dfx12newa, 2) + pow(dfy12newa, 2));
        //delta12Newa = MIN(.99, delta12Newa);
        deltaTheta12Newa = (sqrt((1 + cosf(delta12Newa)) / (1 - cosf(delta12Newa)))) * (1 / DBH);
        moveNode12xa = (MIN(0.0, deltaTheta12Newa - deltaTheta12ia) * (dfx12ia / delta12ia)) / .001147;
        moveNode12ya = (MIN(0.0, deltaTheta12Newa - deltaTheta12ia) * (dfy12ia / delta12ia)) / .001147;
        dfx12Totala += moveNode12xa;
        dfy12Totala += moveNode12ya;
        movement12a = [SKAction moveByX:moveNode12xa y:moveNode12ya duration:0.01];
        deltaTheta12ia = MIN(deltaTheta12ia, deltaTheta12Newa);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx13newa = ((xOrigin13a + dfx13Totala) - BHPosX) * 0.001147;
        dfy13newa = ((yOrigin13a + dfy13Totala) - BHPosY) * 0.001147;
        delta13Newa = sqrt(pow(dfx13newa, 2) + pow(dfy13newa, 2));
        //delta13Newa = MIN(.99, delta13Newa);
        deltaTheta13Newa = (sqrt((1 + cosf(delta13Newa)) / (1 - cosf(delta13Newa)))) * (1 / DBH);
        moveNode13xa = (MIN(0.0, deltaTheta13Newa - deltaTheta13ia) * (dfx13ia / delta13ia)) / .001147;
        moveNode13ya = (MIN(0.0, deltaTheta13Newa - deltaTheta13ia) * (dfy13ia / delta13ia)) / .001147;
        dfx13Totala += moveNode13xa;
        dfy13Totala += moveNode13ya;
        movement13a = [SKAction moveByX:moveNode13xa y:moveNode13ya duration:0.01];
        deltaTheta13ia = MIN(deltaTheta13ia, deltaTheta13Newa);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx14newa = ((xOrigin14a + dfx14Totala) - BHPosX) * 0.001147;
        dfy14newa = ((yOrigin14a + dfy14Totala) - BHPosY) * 0.001147;
        delta14Newa = sqrt(pow(dfx14newa, 2) + pow(dfy14newa, 2));
        //delta14Newa = MIN(.99, delta14Newa);
        deltaTheta14Newa = (sqrt((1 + cosf(delta14Newa)) / (1 - cosf(delta14Newa)))) * (1 / DBH);
        moveNode14xa = (MIN(0.0, deltaTheta14Newa - deltaTheta14ia) * (dfx14ia / delta14ia)) / .001147;
        moveNode14ya = (MIN(0.0, deltaTheta14Newa - deltaTheta14ia) * (dfy14ia / delta14ia)) / .001147;
        dfx14Totala += moveNode14xa;
        dfy14Totala += moveNode14ya;
        movement14a = [SKAction moveByX:moveNode14xa y:moveNode14ya duration:0.01];
        deltaTheta14ia = MIN(deltaTheta14ia, deltaTheta14Newa);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx15newa = ((xOrigin15a + dfx15Totala) - BHPosX) * 0.001147;
        dfy15newa = ((yOrigin15a + dfy15Totala) - BHPosY) * 0.001147;
        delta15Newa = sqrt(pow(dfx15newa, 2) + pow(dfy15newa, 2));
        //delta15Newa = MIN(.99, delta15Newa);
        deltaTheta15Newa = (sqrt((1 + cosf(delta15Newa)) / (1 - cosf(delta15Newa)))) * (1 / DBH);
        moveNode15xa = (MIN(0.0, deltaTheta15Newa - deltaTheta15ia) * (dfx15ia / delta15ia)) / .001147;
        moveNode15ya = (MIN(0.0, deltaTheta15Newa - deltaTheta15ia) * (dfy15ia / delta15ia)) / .001147;
        dfx15Totala += moveNode15xa;
        dfy15Totala += moveNode15ya;
        movement15a = [SKAction moveByX:moveNode15xa y:moveNode15ya duration:0.01];
        deltaTheta15ia = MIN(deltaTheta15ia, deltaTheta15Newa);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx16newa = ((xOrigin16a + dfx16Totala) - BHPosX) * 0.001147;
        dfy16newa = ((yOrigin16a + dfy16Totala) - BHPosY) * 0.001147;
        delta16Newa = sqrt(pow(dfx16newa, 2) + pow(dfy16newa, 2));
        //delta16Newa = MIN(.99, delta16Newa);
        deltaTheta16Newa = (sqrt((1 + cosf(delta16Newa)) / (1 - cosf(delta16Newa)))) * (1 / DBH);
        moveNode16xa = (MIN(0.0, deltaTheta16Newa - deltaTheta16ia) * (dfx16ia / delta16ia)) / .001147;
        moveNode16ya = (MIN(0.0, deltaTheta16Newa - deltaTheta16ia) * (dfy16ia / delta16ia)) / .001147;
        dfx16Totala += moveNode16xa;
        dfy16Totala += moveNode16ya;
        movement16a = [SKAction moveByX:moveNode16xa y:moveNode16ya duration:0.01];
        deltaTheta16ia = MIN(deltaTheta16ia, deltaTheta16Newa);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx17newa = ((xOrigin17a + dfx17Totala) - BHPosX) * 0.001147;
        dfy17newa = ((yOrigin17a + dfy17Totala) - BHPosY) * 0.001147;
        delta17Newa = sqrt(pow(dfx17newa, 2) + pow(dfy17newa, 2));
        //delta17Newa = MIN(.99, delta17Newa);
        deltaTheta17Newa = (sqrt((1 + cosf(delta17Newa)) / (1 - cosf(delta17Newa)))) * (1 / DBH);
        moveNode17xa = (MIN(0.0, deltaTheta17Newa - deltaTheta17ia) * (dfx17ia / delta17ia)) / .001147;
        moveNode17ya = (MIN(0.0, deltaTheta17Newa - deltaTheta17ia) * (dfy17ia / delta17ia)) / .001147;
        dfx17Totala += moveNode17xa;
        dfy17Totala += moveNode17ya;
        movement17a = [SKAction moveByX:moveNode17xa y:moveNode17ya duration:0.01];
        deltaTheta17ia = MIN(deltaTheta17ia, deltaTheta17Newa);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx18newa = ((xOrigin18a + dfx18Totala) - BHPosX) * 0.001147;
        dfy18newa = ((yOrigin18a + dfy18Totala) - BHPosY) * 0.001147;
        delta18Newa = sqrt(pow(dfx18newa, 2) + pow(dfy18newa, 2));
        //delta18Newa = MIN(.99, delta18Newa);
        deltaTheta18Newa = (sqrt((1 + cosf(delta18Newa)) / (1 - cosf(delta18Newa)))) * (1 / DBH);
        moveNode18xa = (MIN(0.0, deltaTheta18Newa - deltaTheta18ia) * (dfx18ia / delta18ia)) / .001147;
        moveNode18ya = (MIN(0.0, deltaTheta18Newa - deltaTheta18ia) * (dfy18ia / delta18ia)) / .001147;
        dfx18Totala += moveNode18xa;
        dfy18Totala += moveNode18ya;
        movement18a = [SKAction moveByX:moveNode18xa y:moveNode18ya duration:0.01];
        deltaTheta18ia = MIN(deltaTheta18ia, deltaTheta18Newa);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx19newa = ((xOrigin19a + dfx19Totala) - BHPosX) * 0.001147;
        dfy19newa = ((yOrigin19a + dfy19Totala) - BHPosY) * 0.001147;
        delta19Newa = sqrt(pow(dfx19newa, 2) + pow(dfy19newa, 2));
        //delta19Newa = MIN(.99, delta19Newa);
        deltaTheta19Newa = (sqrt((1 + cosf(delta19Newa)) / (1 - cosf(delta19Newa)))) * (1 / DBH);
        moveNode19xa = (MIN(0.0, deltaTheta19Newa - deltaTheta19ia) * (dfx19ia / delta19ia)) / .001147;
        moveNode19ya = (MIN(0.0, deltaTheta19Newa - deltaTheta19ia) * (dfy19ia / delta19ia)) / .001147;
        dfx19Totala += moveNode19xa;
        dfy19Totala += moveNode19ya;
        movement19a = [SKAction moveByX:moveNode19xa y:moveNode19ya duration:0.01];
        deltaTheta19ia = MIN(deltaTheta19ia, deltaTheta19Newa);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx20newa = ((xOrigin20a + dfx20Totala) - BHPosX) * 0.001147;
        dfy20newa = ((yOrigin20a + dfy20Totala) - BHPosY) * 0.001147;
        delta20Newa = sqrt(pow(dfx20newa, 2) + pow(dfy20newa, 2));
        //delta20Newa = MIN(.99, delta20Newa);
        deltaTheta20Newa = (sqrt((1 + cosf(delta20Newa)) / (1 - cosf(delta20Newa)))) * (1 / DBH);
        moveNode20xa = (MIN(0.0, deltaTheta20Newa - deltaTheta20ia) * (dfx20ia / delta20ia)) / .001147;
        moveNode20ya = (MIN(0.0, deltaTheta20Newa - deltaTheta20ia) * (dfy20ia / delta20ia)) / .001147;
        dfx20Totala += moveNode20xa;
        dfy20Totala += moveNode20ya;
        movement20a = [SKAction moveByX:moveNode20xa y:moveNode20ya duration:0.01];
        deltaTheta20ia = MIN(deltaTheta20ia, deltaTheta20Newa);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx21newa = ((xOrigin21a + dfx21Totala) - BHPosX) * 0.001147;
        dfy21newa = ((yOrigin21a + dfy21Totala) - BHPosY) * 0.001147;
        delta21Newa = sqrt(pow(dfx21newa, 2) + pow(dfy21newa, 2));
        //delta21Newa = MIN(.99, delta21Newa);
        deltaTheta21Newa = (sqrt((1 + cosf(delta21Newa)) / (1 - cosf(delta21Newa)))) * (1 / DBH);
        moveNode21xa = (MIN(0.0, deltaTheta21Newa - deltaTheta21ia) * (dfx21ia / delta21ia)) / .001147;
        moveNode21ya = (MIN(0.0, deltaTheta21Newa - deltaTheta21ia) * (dfy21ia / delta21ia)) / .001147;
        dfx21Totala += moveNode21xa;
        dfy21Totala += moveNode21ya;
        movement21a = [SKAction moveByX:moveNode21xa y:moveNode21ya duration:0.01];
        deltaTheta21ia = MIN(deltaTheta21ia, deltaTheta21Newa);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx22newa = ((xOrigin22a + dfx22Totala) - BHPosX) * 0.001147;
        dfy22newa = ((yOrigin22a + dfy22Totala) - BHPosY) * 0.001147;
        delta22Newa = sqrt(pow(dfx22newa, 2) + pow(dfy22newa, 2));
        //delta22Newa = MIN(.99, delta22Newa);
        deltaTheta22Newa = (sqrt((1 + cosf(delta22Newa)) / (1 - cosf(delta22Newa)))) * (1 / DBH);
        moveNode22xa = (MIN(0.0, deltaTheta22Newa - deltaTheta22ia) * (dfx22ia / delta22ia)) / .001147;
        moveNode22ya = (MIN(0.0, deltaTheta22Newa - deltaTheta22ia) * (dfy22ia / delta22ia)) / .001147;
        dfx22Totala += moveNode22xa;
        dfy22Totala += moveNode22ya;
        movement22a = [SKAction moveByX:moveNode22xa y:moveNode22ya duration:0.01];
        deltaTheta22ia = MIN(deltaTheta22ia, deltaTheta22Newa);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx23newa = ((xOrigin23a + dfx23Totala) - BHPosX) * 0.001147;
        dfy23newa = ((yOrigin23a + dfy23Totala) - BHPosY) * 0.001147;
        delta23Newa = sqrt(pow(dfx23newa, 2) + pow(dfy23newa, 2));
        //delta23Newa = MIN(.99, delta23Newa);
        deltaTheta23Newa = (sqrt((1 + cosf(delta23Newa)) / (1 - cosf(delta23Newa)))) * (1 / DBH);
        moveNode23xa = (MIN(0.0, deltaTheta23Newa - deltaTheta23ia) * (dfx23ia / delta23ia)) / .001147;
        moveNode23ya = (MIN(0.0, deltaTheta23Newa - deltaTheta23ia) * (dfy23ia / delta23ia)) / .001147;
        dfx23Totala += moveNode23xa;
        dfy23Totala += moveNode23ya;
        movement23a = [SKAction moveByX:moveNode23xa y:moveNode23ya duration:0.01];
        deltaTheta23ia = MIN(deltaTheta23ia, deltaTheta23Newa);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx24newa = ((xOrigin24a + dfx24Totala) - BHPosX) * 0.001147;
        dfy24newa = ((yOrigin24a + dfy24Totala) - BHPosY) * 0.001147;
        delta24Newa = sqrt(pow(dfx24newa, 2) + pow(dfy24newa, 2));
        //delta24Newa = MIN(.99, delta24Newa);
        deltaTheta24Newa = (sqrt((1 + cosf(delta24Newa)) / (1 - cosf(delta24Newa)))) * (1 / DBH);
        moveNode24xa = (MIN(0.0, deltaTheta24Newa - deltaTheta24ia) * (dfx24ia / delta24ia)) / .001147;
        moveNode24ya = (MIN(0.0, deltaTheta24Newa - deltaTheta24ia) * (dfy24ia / delta24ia)) / .001147;
        dfx24Totala += moveNode24xa;
        dfy24Totala += moveNode24ya;
        movement24a = [SKAction moveByX:moveNode24xa y:moveNode24ya duration:0.01];
        deltaTheta24ia = MIN(deltaTheta24ia, deltaTheta24Newa);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx25newa = ((xOrigin25a + dfx25Totala) - BHPosX) * 0.001147;
        dfy25newa = ((yOrigin25a + dfy25Totala) - BHPosY) * 0.001147;
        delta25Newa = sqrt(pow(dfx25newa, 2) + pow(dfy25newa, 2));
        //delta25Newa = MIN(.99, delta25Newa);
        deltaTheta25Newa = (sqrt((1 + cosf(delta25Newa)) / (1 - cosf(delta25Newa)))) * (1 / DBH);
        moveNode25xa = (MIN(0.0, deltaTheta25Newa - deltaTheta25ia) * (dfx25ia / delta25ia)) / .001147;
        moveNode25ya = (MIN(0.0, deltaTheta25Newa - deltaTheta25ia) * (dfy25ia / delta25ia)) / .001147;
        dfx25Totala += moveNode25xa;
        dfy25Totala += moveNode25ya;
        movement25a = [SKAction moveByX:moveNode25xa y:moveNode25ya duration:0.01];
        deltaTheta25ia = MIN(deltaTheta25ia, deltaTheta25Newa);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx26newa = ((xOrigin26a + dfx26Totala) - BHPosX) * 0.001147;
        dfy26newa = ((yOrigin26a + dfy26Totala) - BHPosY) * 0.001147;
        delta26Newa = sqrt(pow(dfx26newa, 2) + pow(dfy26newa, 2));
        //delta26Newa = MIN(.99, delta26Newa);
        deltaTheta26Newa = (sqrt((1 + cosf(delta26Newa)) / (1 - cosf(delta26Newa)))) * (1 / DBH);
        moveNode26xa = (MIN(0.0, deltaTheta26Newa - deltaTheta26ia) * (dfx26ia / delta26ia)) / .001147;
        moveNode26ya = (MIN(0.0, deltaTheta26Newa - deltaTheta26ia) * (dfy26ia / delta26ia)) / .001147;
        dfx26Totala += moveNode26xa;
        dfy26Totala += moveNode26ya;
        movement26a = [SKAction moveByX:moveNode26xa y:moveNode26ya duration:0.01];
        deltaTheta26ia = MIN(deltaTheta26ia, deltaTheta26Newa);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx27newa = ((xOrigin27a + dfx27Totala) - BHPosX) * 0.001147;
        dfy27newa = ((yOrigin27a + dfy27Totala) - BHPosY) * 0.001147;
        delta27Newa = sqrt(pow(dfx27newa, 2) + pow(dfy27newa, 2));
        //delta27Newa = MIN(.99, delta27Newa);
        deltaTheta27Newa = (sqrt((1 + cosf(delta27Newa)) / (1 - cosf(delta27Newa)))) * (1 / DBH);
        moveNode27xa = (MIN(0.0, deltaTheta27Newa - deltaTheta27ia) * (dfx27ia / delta27ia)) / .001147;
        moveNode27ya = (MIN(0.0, deltaTheta27Newa - deltaTheta27ia) * (dfy27ia / delta27ia)) / .001147;
        dfx27Totala += moveNode27xa;
        dfy27Totala += moveNode27ya;
        movement27a = [SKAction moveByX:moveNode27xa y:moveNode27ya duration:0.01];
        deltaTheta27ia = MIN(deltaTheta27ia, deltaTheta27Newa);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx28newa = ((xOrigin28a + dfx28Totala) - BHPosX) * 0.001147;
        dfy28newa = ((yOrigin28a + dfy28Totala) - BHPosY) * 0.001147;
        delta28Newa = sqrt(pow(dfx28newa, 2) + pow(dfy28newa, 2));
        //delta28Newa = MIN(.99, delta28Newa);
        deltaTheta28Newa = (sqrt((1 + cosf(delta28Newa)) / (1 - cosf(delta28Newa)))) * (1 / DBH);
        moveNode28xa = (MIN(0.0, deltaTheta28Newa - deltaTheta28ia) * (dfx28ia / delta28ia)) / .001147;
        moveNode28ya = (MIN(0.0, deltaTheta28Newa - deltaTheta28ia) * (dfy28ia / delta28ia)) / .001147;
        dfx28Totala += moveNode28xa;
        dfy28Totala += moveNode28ya;
        movement28a = [SKAction moveByX:moveNode28xa y:moveNode28ya duration:0.01];
        deltaTheta28ia = MIN(deltaTheta28ia, deltaTheta28Newa);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx29newa = ((xOrigin29a + dfx29Totala) - BHPosX) * 0.001147;
        dfy29newa = ((yOrigin29a + dfy29Totala) - BHPosY) * 0.001147;
        delta29Newa = sqrt(pow(dfx29newa, 2) + pow(dfy29newa, 2));
        //delta29Newa = MIN(.99, delta29Newa);
        deltaTheta29Newa = (sqrt((1 + cosf(delta29Newa)) / (1 - cosf(delta29Newa)))) * (1 / DBH);
        moveNode29xa = (MIN(0.0, deltaTheta29Newa - deltaTheta29ia) * (dfx29ia / delta29ia)) / .001147;
        moveNode29ya = (MIN(0.0, deltaTheta29Newa - deltaTheta29ia) * (dfy29ia / delta29ia)) / .001147;
        dfx29Totala += moveNode29xa;
        dfy29Totala += moveNode29ya;
        movement29a = [SKAction moveByX:moveNode29xa y:moveNode29ya duration:0.01];
        deltaTheta29ia = MIN(deltaTheta29ia, deltaTheta29Newa);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx30newa = ((xOrigin30a + dfx30Totala) - BHPosX) * 0.001147;
        dfy30newa = ((yOrigin30a + dfy30Totala) - BHPosY) * 0.001147;
        delta30Newa = sqrt(pow(dfx30newa, 2) + pow(dfy30newa, 2));
        //delta30Newa = MIN(.99, delta30Newa);
        deltaTheta30Newa = (sqrt((1 + cosf(delta30Newa)) / (1 - cosf(delta30Newa)))) * (1 / DBH);
        moveNode30xa = (MIN(0.0, deltaTheta30Newa - deltaTheta30ia) * (dfx30ia / delta30ia)) / .001147;
        moveNode30ya = (MIN(0.0, deltaTheta30Newa - deltaTheta30ia) * (dfy30ia / delta30ia)) / .001147;
        dfx30Totala += moveNode30xa;
        dfy30Totala += moveNode30ya;
        movement30a = [SKAction moveByX:moveNode30xa y:moveNode30ya duration:0.01];
        deltaTheta30ia = MIN(deltaTheta30ia, deltaTheta30Newa);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx31newa = ((xOrigin31a + dfx31Totala) - BHPosX) * 0.001147;
        dfy31newa = ((yOrigin31a + dfy31Totala) - BHPosY) * 0.001147;
        delta31Newa = sqrt(pow(dfx31newa, 2) + pow(dfy31newa, 2));
        //delta31Newa = MIN(.99, delta31Newa);
        deltaTheta31Newa = (sqrt((1 + cosf(delta31Newa)) / (1 - cosf(delta31Newa)))) * (1 / DBH);
        moveNode31xa = (MIN(0.0, deltaTheta31Newa - deltaTheta31ia) * (dfx31ia / delta31ia)) / .001147;
        moveNode31ya = (MIN(0.0, deltaTheta31Newa - deltaTheta31ia) * (dfy31ia / delta31ia)) / .001147;
        dfx31Totala += moveNode31xa;
        dfy31Totala += moveNode31ya;
        movement31a = [SKAction moveByX:moveNode31xa y:moveNode31ya duration:0.01];
        deltaTheta31ia = MIN(deltaTheta31ia, deltaTheta31Newa);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx32newa = ((xOrigin32a + dfx32Totala) - BHPosX) * 0.001147;
        dfy32newa = ((yOrigin32a + dfy32Totala) - BHPosY) * 0.001147;
        delta32Newa = sqrt(pow(dfx32newa, 2) + pow(dfy32newa, 2));
        //delta32Newa = MIN(.99, delta32Newa);
        deltaTheta32Newa = (sqrt((1 + cosf(delta32Newa)) / (1 - cosf(delta32Newa)))) * (1 / DBH);
        moveNode32xa = (MIN(0.0, deltaTheta32Newa - deltaTheta32ia) * (dfx32ia / delta32ia)) / .001147;
        moveNode32ya = (MIN(0.0, deltaTheta32Newa - deltaTheta32ia) * (dfy32ia / delta32ia)) / .001147;
        dfx32Totala += moveNode32xa;
        dfy32Totala += moveNode32ya;
        movement32a = [SKAction moveByX:moveNode32xa y:moveNode32ya duration:0.01];
        deltaTheta32ia = MIN(deltaTheta32ia, deltaTheta32Newa);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx33newa = ((xOrigin33a + dfx33Totala) - BHPosX) * 0.001147;
        dfy33newa = ((yOrigin33a + dfy33Totala) - BHPosY) * 0.001147;
        delta33Newa = sqrt(pow(dfx33newa, 2) + pow(dfy33newa, 2));
        //delta33Newa = MIN(.99, delta33Newa);
        deltaTheta33Newa = (sqrt((1 + cosf(delta33Newa)) / (1 - cosf(delta33Newa)))) * (1 / DBH);
        moveNode33xa = (MIN(0.0, deltaTheta33Newa - deltaTheta33ia) * (dfx33ia / delta33ia)) / .001147;
        moveNode33ya = (MIN(0.0, deltaTheta33Newa - deltaTheta33ia) * (dfy33ia / delta33ia)) / .001147;
        dfx33Totala += moveNode33xa;
        dfy33Totala += moveNode33ya;
        movement33a = [SKAction moveByX:moveNode33xa y:moveNode33ya duration:0.01];
        deltaTheta33ia = MIN(deltaTheta33ia, deltaTheta33Newa);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx34newa = ((xOrigin34a + dfx34Totala) - BHPosX) * 0.001147;
        dfy34newa = ((yOrigin34a + dfy34Totala) - BHPosY) * 0.001147;
        delta34Newa = sqrt(pow(dfx34newa, 2) + pow(dfy34newa, 2));
        //delta34Newa = MIN(.99, delta34Newa);
        deltaTheta34Newa = (sqrt((1 + cosf(delta34Newa)) / (1 - cosf(delta34Newa)))) * (1 / DBH);
        moveNode34xa = (MIN(0.0, deltaTheta34Newa - deltaTheta34ia) * (dfx34ia / delta34ia)) / .001147;
        moveNode34ya = (MIN(0.0, deltaTheta34Newa - deltaTheta34ia) * (dfy34ia / delta34ia)) / .001147;
        dfx34Totala += moveNode34xa;
        dfy34Totala += moveNode34ya;
        movement34a = [SKAction moveByX:moveNode34xa y:moveNode34ya duration:0.01];
        deltaTheta34ia = MIN(deltaTheta34ia, deltaTheta34Newa);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx35newa = ((xOrigin35a + dfx35Totala) - BHPosX) * 0.001147;
        dfy35newa = ((yOrigin35a + dfy35Totala) - BHPosY) * 0.001147;
        delta35Newa = sqrt(pow(dfx35newa, 2) + pow(dfy35newa, 2));
        //delta35Newa = MIN(.99, delta35Newa);
        deltaTheta35Newa = (sqrt((1 + cosf(delta35Newa)) / (1 - cosf(delta35Newa)))) * (1 / DBH);
        moveNode35xa = (MIN(0.0, deltaTheta35Newa - deltaTheta35ia) * (dfx35ia / delta35ia)) / .001147;
        moveNode35ya = (MIN(0.0, deltaTheta35Newa - deltaTheta35ia) * (dfy35ia / delta35ia)) / .001147;
        dfx35Totala += moveNode35xa;
        dfy35Totala += moveNode35ya;
        movement35a = [SKAction moveByX:moveNode35xa y:moveNode35ya duration:0.01];
        deltaTheta35ia = MIN(deltaTheta35ia, deltaTheta35Newa);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx36newa = ((xOrigin36a + dfx36Totala) - BHPosX) * 0.001147;
        dfy36newa = ((yOrigin36a + dfy36Totala) - BHPosY) * 0.001147;
        delta36Newa = sqrt(pow(dfx36newa, 2) + pow(dfy36newa, 2));
        //delta36Newa = MIN(.99, delta36Newa);
        deltaTheta36Newa = (sqrt((1 + cosf(delta36Newa)) / (1 - cosf(delta36Newa)))) * (1 / DBH);
        moveNode36xa = (MIN(0.0, deltaTheta36Newa - deltaTheta36ia) * (dfx36ia / delta36ia)) / .001147;
        moveNode36ya = (MIN(0.0, deltaTheta36Newa - deltaTheta36ia) * (dfy36ia / delta36ia)) / .001147;
        dfx36Totala += moveNode36xa;
        dfy36Totala += moveNode36ya;
        movement36a = [SKAction moveByX:moveNode36xa y:moveNode36ya duration:0.01];
        deltaTheta36ia = MIN(deltaTheta36ia, deltaTheta36Newa);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx37newa = ((xOrigin37a + dfx37Totala) - BHPosX) * 0.001147;
        dfy37newa = ((yOrigin37a + dfy37Totala) - BHPosY) * 0.001147;
        delta37Newa = sqrt(pow(dfx37newa, 2) + pow(dfy37newa, 2));
        //delta37Newa = MIN(.99, delta37Newa);
        deltaTheta37Newa = (sqrt((1 + cosf(delta37Newa)) / (1 - cosf(delta37Newa)))) * (1 / DBH);
        moveNode37xa = (MIN(0.0, deltaTheta37Newa - deltaTheta37ia) * (dfx37ia / delta37ia)) / .001147;
        moveNode37ya = (MIN(0.0, deltaTheta37Newa - deltaTheta37ia) * (dfy37ia / delta37ia)) / .001147;
        dfx37Totala += moveNode37xa;
        dfy37Totala += moveNode37ya;
        movement37a = [SKAction moveByX:moveNode37xa y:moveNode37ya duration:0.01];
        deltaTheta37ia = MIN(deltaTheta37ia, deltaTheta37Newa);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx38newa = ((xOrigin38a + dfx38Totala) - BHPosX) * 0.001147;
        dfy38newa = ((yOrigin38a + dfy38Totala) - BHPosY) * 0.001147;
        delta38Newa = sqrt(pow(dfx38newa, 2) + pow(dfy38newa, 2));
        //delta38Newa = MIN(.99, delta38Newa);
        deltaTheta38Newa = (sqrt((1 + cosf(delta38Newa)) / (1 - cosf(delta38Newa)))) * (1 / DBH);
        moveNode38xa = (MIN(0.0, deltaTheta38Newa - deltaTheta38ia) * (dfx38ia / delta38ia)) / .001147;
        moveNode38ya = (MIN(0.0, deltaTheta38Newa - deltaTheta38ia) * (dfy38ia / delta38ia)) / .001147;
        dfx38Totala += moveNode38xa;
        dfy38Totala += moveNode38ya;
        movement38a = [SKAction moveByX:moveNode38xa y:moveNode38ya duration:0.01];
        deltaTheta38ia = MIN(deltaTheta38ia, deltaTheta38Newa);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx39newa = ((xOrigin39a + dfx39Totala) - BHPosX) * 0.001147;
        dfy39newa = ((yOrigin39a + dfy39Totala) - BHPosY) * 0.001147;
        delta39Newa = sqrt(pow(dfx39newa, 2) + pow(dfy39newa, 2));
        //delta39Newa = MIN(.99, delta39Newa);
        deltaTheta39Newa = (sqrt((1 + cosf(delta39Newa)) / (1 - cosf(delta39Newa)))) * (1 / DBH);
        moveNode39xa = (MIN(0.0, deltaTheta39Newa - deltaTheta39ia) * (dfx39ia / delta39ia)) / .001147;
        moveNode39ya = (MIN(0.0, deltaTheta39Newa - deltaTheta39ia) * (dfy39ia / delta39ia)) / .001147;
        dfx39Totala += moveNode39xa;
        dfy39Totala += moveNode39ya;
        movement39a = [SKAction moveByX:moveNode39xa y:moveNode39ya duration:0.01];
        deltaTheta39ia = MIN(deltaTheta39ia, deltaTheta39Newa);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx40newa = ((xOrigin40a + dfx40Totala) - BHPosX) * 0.001147;
        dfy40newa = ((yOrigin40a + dfy40Totala) - BHPosY) * 0.001147;
        delta40Newa = sqrt(pow(dfx40newa, 2) + pow(dfy40newa, 2));
        //delta40Newa = MIN(.99, delta40Newa);
        deltaTheta40Newa = (sqrt((1 + cosf(delta40Newa)) / (1 - cosf(delta40Newa)))) * (1 / DBH);
        moveNode40xa = (MIN(0.0, deltaTheta40Newa - deltaTheta40ia) * (dfx40ia / delta40ia)) / .001147;
        moveNode40ya = (MIN(0.0, deltaTheta40Newa - deltaTheta40ia) * (dfy40ia / delta40ia)) / .001147;
        dfx40Totala += moveNode40xa;
        dfy40Totala += moveNode40ya;
        movement40a = [SKAction moveByX:moveNode40xa y:moveNode40ya duration:0.01];
        deltaTheta40ia = MIN(deltaTheta40ia, deltaTheta40Newa);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx41newa = ((xOrigin41a + dfx41Totala) - BHPosX) * 0.001147;
        dfy41newa = ((yOrigin41a + dfy41Totala) - BHPosY) * 0.001147;
        delta41Newa = sqrt(pow(dfx41newa, 2) + pow(dfy41newa, 2));
        //delta41Newa = MIN(.99, delta41Newa);
        deltaTheta41Newa = (sqrt((1 + cosf(delta41Newa)) / (1 - cosf(delta41Newa)))) * (1 / DBH);
        moveNode41xa = (MIN(0.0, deltaTheta41Newa - deltaTheta41ia) * (dfx41ia / delta41ia)) / .001147;
        moveNode41ya = (MIN(0.0, deltaTheta41Newa - deltaTheta41ia) * (dfy41ia / delta41ia)) / .001147;
        dfx41Totala += moveNode41xa;
        dfy41Totala += moveNode41ya;
        movement41a = [SKAction moveByX:moveNode41xa y:moveNode41ya duration:0.01];
        deltaTheta41ia = MIN(deltaTheta41ia, deltaTheta41Newa);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx42newa = ((xOrigin42a + dfx42Totala) - BHPosX) * 0.001147;
        dfy42newa = ((yOrigin42a + dfy42Totala) - BHPosY) * 0.001147;
        delta42Newa = sqrt(pow(dfx42newa, 2) + pow(dfy42newa, 2));
        //delta42Newa = MIN(.99, delta42Newa);
        deltaTheta42Newa = (sqrt((1 + cosf(delta42Newa)) / (1 - cosf(delta42Newa)))) * (1 / DBH);
        moveNode42xa = (MIN(0.0, deltaTheta42Newa - deltaTheta42ia) * (dfx42ia / delta42ia)) / .001147;
        moveNode42ya = (MIN(0.0, deltaTheta42Newa - deltaTheta42ia) * (dfy42ia / delta42ia)) / .001147;
        dfx42Totala += moveNode42xa;
        dfy42Totala += moveNode42ya;
        movement42a = [SKAction moveByX:moveNode42xa y:moveNode42ya duration:0.01];
        deltaTheta42ia = MIN(deltaTheta42ia, deltaTheta42Newa);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx43newa = ((xOrigin43a + dfx43Totala) - BHPosX) * 0.001147;
        dfy43newa = ((yOrigin43a + dfy43Totala) - BHPosY) * 0.001147;
        delta43Newa = sqrt(pow(dfx43newa, 2) + pow(dfy43newa, 2));
        //delta43Newa = MIN(.99, delta43Newa);
        deltaTheta43Newa = (sqrt((1 + cosf(delta43Newa)) / (1 - cosf(delta43Newa)))) * (1 / DBH);
        moveNode43xa = (MIN(0.0, deltaTheta43Newa - deltaTheta43ia) * (dfx43ia / delta43ia)) / .001147;
        moveNode43ya = (MIN(0.0, deltaTheta43Newa - deltaTheta43ia) * (dfy43ia / delta43ia)) / .001147;
        dfx43Totala += moveNode43xa;
        dfy43Totala += moveNode43ya;
        movement43a = [SKAction moveByX:moveNode43xa y:moveNode43ya duration:0.01];
        deltaTheta43ia = MIN(deltaTheta43ia, deltaTheta43Newa);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx44newa = ((xOrigin44a + dfx44Totala) - BHPosX) * 0.001147;
        dfy44newa = ((yOrigin44a + dfy44Totala) - BHPosY) * 0.001147;
        delta44Newa = sqrt(pow(dfx44newa, 2) + pow(dfy44newa, 2));
        //delta44Newa = MIN(.99, delta44Newa);
        deltaTheta44Newa = (sqrt((1 + cosf(delta44Newa)) / (1 - cosf(delta44Newa)))) * (1 / DBH);
        moveNode44xa = (MIN(0.0, deltaTheta44Newa - deltaTheta44ia) * (dfx44ia / delta44ia)) / .001147;
        moveNode44ya = (MIN(0.0, deltaTheta44Newa - deltaTheta44ia) * (dfy44ia / delta44ia)) / .001147;
        dfx44Totala += moveNode44xa;
        dfy44Totala += moveNode44ya;
        movement44a = [SKAction moveByX:moveNode44xa y:moveNode44ya duration:0.01];
        deltaTheta44ia = MIN(deltaTheta44ia, deltaTheta44Newa);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx45newa = ((xOrigin45a + dfx45Totala) - BHPosX) * 0.001147;
        dfy45newa = ((yOrigin45a + dfy45Totala) - BHPosY) * 0.001147;
        delta45Newa = sqrt(pow(dfx45newa, 2) + pow(dfy45newa, 2));
        //delta45Newa = MIN(.99, delta45Newa);
        deltaTheta45Newa = (sqrt((1 + cosf(delta45Newa)) / (1 - cosf(delta45Newa)))) * (1 / DBH);
        moveNode45xa = (MIN(0.0, deltaTheta45Newa - deltaTheta45ia) * (dfx45ia / delta45ia)) / .001147;
        moveNode45ya = (MIN(0.0, deltaTheta45Newa - deltaTheta45ia) * (dfy45ia / delta45ia)) / .001147;
        dfx45Totala += moveNode45xa;
        dfy45Totala += moveNode45ya;
        movement45a = [SKAction moveByX:moveNode45xa y:moveNode45ya duration:0.01];
        deltaTheta45ia = MIN(deltaTheta45ia, deltaTheta45Newa);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx46newa = ((xOrigin46a + dfx46Totala) - BHPosX) * 0.001147;
        dfy46newa = ((yOrigin46a + dfy46Totala) - BHPosY) * 0.001147;
        delta46Newa = sqrt(pow(dfx46newa, 2) + pow(dfy46newa, 2));
        //delta46Newa = MIN(.99, delta46Newa);
        deltaTheta46Newa = (sqrt((1 + cosf(delta46Newa)) / (1 - cosf(delta46Newa)))) * (1 / DBH);
        moveNode46xa = (MIN(0.0, deltaTheta46Newa - deltaTheta46ia) * (dfx46ia / delta46ia)) / .001147;
        moveNode46ya = (MIN(0.0, deltaTheta46Newa - deltaTheta46ia) * (dfy46ia / delta46ia)) / .001147;
        dfx46Totala += moveNode46xa;
        dfy46Totala += moveNode46ya;
        movement46a = [SKAction moveByX:moveNode46xa y:moveNode46ya duration:0.01];
        deltaTheta46ia = MIN(deltaTheta46ia, deltaTheta46Newa);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        dfx47newa = ((xOrigin47a + dfx47Totala) - BHPosX) * 0.001147;
        dfy47newa = ((yOrigin47a + dfy47Totala) - BHPosY) * 0.001147;
        delta47Newa = sqrt(pow(dfx47newa, 2) + pow(dfy47newa, 2));
        //delta47Newa = MIN(.99, delta47Newa);
        deltaTheta47Newa = (sqrt((1 + cosf(delta47Newa)) / (1 - cosf(delta47Newa)))) * (1 / DBH);
        moveNode47xa = (MIN(0.0, deltaTheta47Newa - deltaTheta47ia) * (dfx47ia / delta47ia)) / .001147;
        moveNode47ya = (MIN(0.0, deltaTheta47Newa - deltaTheta47ia) * (dfy47ia / delta47ia)) / .001147;
        dfx47Totala += moveNode47xa;
        dfy47Totala += moveNode47ya;
        movement47a = [SKAction moveByX:moveNode47xa y:moveNode47ya duration:0.01];
        deltaTheta47ia = MIN(deltaTheta47ia, deltaTheta47Newa);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        [shapeNode1 runAction: movement1];
        shapeNode1.xScale = deltaMag1;
        shapeNode1.yScale = deltaMag1;
        
        [shapeNode2 runAction: movement2];
        shapeNode2.xScale = deltaMag2;
        shapeNode2.yScale = deltaMag2;
        
        [shapeNode3 runAction: movement3];
        shapeNode3.xScale = deltaMag3;
        shapeNode3.yScale = deltaMag3;
        
        [shapeNode4 runAction: movement4];
        shapeNode4.xScale = deltaMag4;
        shapeNode4.yScale = deltaMag4;
        
        [shapeNode5 runAction: movement5];
        shapeNode5.xScale = deltaMag5;
        shapeNode5.yScale = deltaMag5;
        
        [shapeNode6 runAction: movement6];
        shapeNode6.xScale = deltaMag6;
        shapeNode6.yScale = deltaMag6;
        
        [shapeNode7 runAction: movement7];
        shapeNode7.xScale = deltaMag7;
        shapeNode7.yScale = deltaMag7;
        
        [shapeNode8 runAction: movement8];
        shapeNode8.xScale = deltaMag8;
        shapeNode8.yScale = deltaMag8;
        
        [shapeNode9 runAction: movement9];
        shapeNode9.xScale = deltaMag9;
        shapeNode9.yScale = deltaMag9;
        
        [shapeNode10 runAction: movement10];
        shapeNode10.xScale = deltaMag10;
        shapeNode10.yScale = deltaMag10;
        
        [shapeNode11 runAction: movement11];
        shapeNode11.xScale = deltaMag11;
        shapeNode11.yScale = deltaMag11;
        
        [shapeNode12 runAction: movement12];
        shapeNode12.xScale = deltaMag12;
        shapeNode12.yScale = deltaMag12;
        
        [shapeNode13 runAction: movement13];
        shapeNode13.xScale = deltaMag13;
        shapeNode13.yScale = deltaMag13;
        
        [shapeNode14 runAction: movement14];
        shapeNode14.xScale = deltaMag14;
        shapeNode14.yScale = deltaMag14;
        
        [shapeNode15 runAction: movement15];
        shapeNode15.xScale = deltaMag15;
        shapeNode15.yScale = deltaMag15;
        
        [shapeNode16 runAction: movement16];
        shapeNode16.xScale = deltaMag16;
        shapeNode16.yScale = deltaMag16;
        
        [shapeNode17 runAction: movement17];
        shapeNode17.xScale = deltaMag17;
        shapeNode17.yScale = deltaMag17;
        
        [shapeNode18 runAction: movement18];
        shapeNode18.xScale = deltaMag18;
        shapeNode18.yScale = deltaMag18;
        
        [shapeNode19 runAction: movement19];
        shapeNode19.xScale = deltaMag19;
        shapeNode19.yScale = deltaMag19;
        
        [shapeNode20 runAction: movement20];
        shapeNode20.xScale = deltaMag20;
        shapeNode20.yScale = deltaMag20;
        
        [shapeNode21 runAction: movement21];
        shapeNode21.xScale = deltaMag21;
        shapeNode21.yScale = deltaMag21;
        
        [shapeNode22 runAction: movement22];
        shapeNode22.xScale = deltaMag22;
        shapeNode22.yScale = deltaMag22;
        
        [shapeNode23 runAction: movement23];
        shapeNode23.xScale = deltaMag23;
        shapeNode23.yScale = deltaMag23;
        
        [shapeNode24 runAction: movement24];
        shapeNode24.xScale = deltaMag24;
        shapeNode24.yScale = deltaMag24;
        
        [shapeNode25 runAction: movement25];
        shapeNode25.xScale = deltaMag25;
        shapeNode25.yScale = deltaMag25;
        
        [shapeNode26 runAction: movement26];
        shapeNode26.xScale = deltaMag26;
        shapeNode26.yScale = deltaMag26;
        
        [shapeNode27 runAction: movement27];
        shapeNode27.xScale = deltaMag27;
        shapeNode27.yScale = deltaMag27;
        
        [shapeNode28 runAction: movement28];
        shapeNode28.xScale = deltaMag28;
        shapeNode28.yScale = deltaMag28;
        
        [shapeNode29 runAction: movement29];
        shapeNode29.xScale = deltaMag29;
        shapeNode29.yScale = deltaMag29;
        
        [shapeNode30 runAction: movement30];
        shapeNode30.xScale = deltaMag30;
        shapeNode30.yScale = deltaMag30;
        
        [shapeNode31 runAction: movement31];
        shapeNode31.xScale = deltaMag31;
        shapeNode31.yScale = deltaMag31;
        
        [shapeNode32 runAction: movement32];
        shapeNode32.xScale = deltaMag32;
        shapeNode32.yScale = deltaMag32;
        
        [shapeNode33 runAction: movement33];
        shapeNode33.xScale = deltaMag33;
        shapeNode33.yScale = deltaMag33;
        
        [shapeNode34 runAction: movement34];
        shapeNode34.xScale = deltaMag34;
        shapeNode34.yScale = deltaMag34;
        
        [shapeNode35 runAction: movement35];
        shapeNode35.xScale = deltaMag35;
        shapeNode35.yScale = deltaMag35;
        
        [shapeNode36 runAction: movement36];
        shapeNode36.xScale = deltaMag36;
        shapeNode36.yScale = deltaMag36;
        
        [shapeNode37 runAction: movement37];
        shapeNode37.xScale = deltaMag37;
        shapeNode37.yScale = deltaMag37;
        
        [shapeNode38 runAction: movement38];
        shapeNode38.xScale = deltaMag38;
        shapeNode38.yScale = deltaMag38;
        
        [shapeNode39 runAction: movement39];
        shapeNode39.xScale = deltaMag39;
        shapeNode39.yScale = deltaMag39;
        
        [shapeNode40 runAction: movement40];
        shapeNode40.xScale = deltaMag40;
        shapeNode40.yScale = deltaMag40;
        
        [shapeNode41 runAction: movement41];
        shapeNode41.xScale = deltaMag41;
        shapeNode41.yScale = deltaMag41;
        
        [shapeNode42 runAction: movement42];
        shapeNode42.xScale = deltaMag42;
        shapeNode42.yScale = deltaMag42;
        
        [shapeNode43 runAction: movement43];
        shapeNode43.xScale = deltaMag43;
        shapeNode43.yScale = deltaMag43;
        
        [shapeNode44 runAction: movement44];
        shapeNode44.xScale = deltaMag44;
        shapeNode44.yScale = deltaMag44;
        
        [shapeNode45 runAction: movement45];
        shapeNode45.xScale = deltaMag45;
        shapeNode45.yScale = deltaMag45;
        
        [shapeNode46 runAction: movement46];
        shapeNode46.xScale = deltaMag46;
        shapeNode46.yScale = deltaMag46;
        
        [shapeNode47 runAction: movement47];
        shapeNode47.xScale = deltaMag47;
        shapeNode47.yScale = deltaMag47;
        
        
        //Ambient stars
        [shapeNode1a runAction: movement1a];
        shapeNode1a.xScale = deltaMag1a;
        shapeNode1a.yScale = deltaMag1a;
        
        [shapeNode2a runAction: movement2a];
        shapeNode2a.xScale = deltaMag2a;
        shapeNode2a.yScale = deltaMag2a;
        
        [shapeNode3a runAction: movement3a];
        shapeNode3a.xScale = deltaMag3a;
        shapeNode3a.yScale = deltaMag3a;
        
        [shapeNode4a runAction: movement4a];
        shapeNode4a.xScale = deltaMag4a;
        shapeNode4a.yScale = deltaMag4a;
        
        [shapeNode5a runAction: movement5a];
        shapeNode5a.xScale = deltaMag5a;
        shapeNode5a.yScale = deltaMag5a;
        
        [shapeNode6a runAction: movement6a];
        shapeNode6a.xScale = deltaMag6a;
        shapeNode6a.yScale = deltaMag6a;
        
        [shapeNode7a runAction: movement7a];
        shapeNode7a.xScale = deltaMag7a;
        shapeNode7a.yScale = deltaMag7a;
        
        [shapeNode8a runAction: movement8a];
        shapeNode8a.xScale = deltaMag8a;
        shapeNode8a.yScale = deltaMag8a;
        
        [shapeNode9a runAction: movement9a];
        shapeNode9a.xScale = deltaMag9a;
        shapeNode9a.yScale = deltaMag9a;
        
        [shapeNode10a runAction: movement10a];
        shapeNode10a.xScale = deltaMag10a;
        shapeNode10a.yScale = deltaMag10a;
        
        [shapeNode11a runAction: movement11a];
        shapeNode11a.xScale = deltaMag11a;
        shapeNode11a.yScale = deltaMag11a;
        
        [shapeNode12a runAction: movement12a];
        shapeNode12a.xScale = deltaMag12a;
        shapeNode12a.yScale = deltaMag12a;
        
        [shapeNode13a runAction: movement13a];
        shapeNode13a.xScale = deltaMag13a;
        shapeNode13a.yScale = deltaMag13a;
        
        [shapeNode14a runAction: movement14a];
        shapeNode14a.xScale = deltaMag14a;
        shapeNode14a.yScale = deltaMag14a;
        
        [shapeNode15a runAction: movement15a];
        shapeNode15a.xScale = deltaMag15a;
        shapeNode15a.yScale = deltaMag15a;
        
        [shapeNode16a runAction: movement16a];
        shapeNode16a.xScale = deltaMag16a;
        shapeNode16a.yScale = deltaMag16a;
        
        [shapeNode17a runAction: movement17a];
        shapeNode17a.xScale = deltaMag17a;
        shapeNode17a.yScale = deltaMag17a;
        
        [shapeNode18a runAction: movement18a];
        shapeNode18a.xScale = deltaMag18a;
        shapeNode18a.yScale = deltaMag18a;
        
        [shapeNode19a runAction: movement19a];
        shapeNode19a.xScale = deltaMag19a;
        shapeNode19a.yScale = deltaMag19a;
        
        [shapeNode20a runAction: movement20a];
        shapeNode20a.xScale = deltaMag20a;
        shapeNode20a.yScale = deltaMag20a;
        
        [shapeNode21a runAction: movement21a];
        shapeNode21a.xScale = deltaMag21a;
        shapeNode21a.yScale = deltaMag21a;
        
        [shapeNode22a runAction: movement22a];
        shapeNode22a.xScale = deltaMag22a;
        shapeNode22a.yScale = deltaMag22a;
        
        [shapeNode23a runAction: movement23a];
        shapeNode23a.xScale = deltaMag23a;
        shapeNode23a.yScale = deltaMag23a;
        
        [shapeNode24a runAction: movement24a];
        shapeNode24a.xScale = deltaMag24a;
        shapeNode24a.yScale = deltaMag24a;
        
        [shapeNode25a runAction: movement25a];
        shapeNode25a.xScale = deltaMag25a;
        shapeNode25a.yScale = deltaMag25a;
        
        [shapeNode26a runAction: movement26a];
        shapeNode26a.xScale = deltaMag26a;
        shapeNode26a.yScale = deltaMag26a;
        
        [shapeNode27a runAction: movement27a];
        shapeNode27a.xScale = deltaMag27a;
        shapeNode27a.yScale = deltaMag27a;
        
        [shapeNode28a runAction: movement28a];
        shapeNode28a.xScale = deltaMag28a;
        shapeNode28a.yScale = deltaMag28a;
        
        [shapeNode29a runAction: movement29a];
        shapeNode29a.xScale = deltaMag29a;
        shapeNode29a.yScale = deltaMag29a;
        
        [shapeNode30a runAction: movement30a];
        shapeNode30a.xScale = deltaMag30a;
        shapeNode30a.yScale = deltaMag30a;
        
        [shapeNode31a runAction: movement31a];
        shapeNode31a.xScale = deltaMag31a;
        shapeNode31a.yScale = deltaMag31a;
        
        [shapeNode32a runAction: movement32a];
        shapeNode32a.xScale = deltaMag32a;
        shapeNode32a.yScale = deltaMag32a;
        
        [shapeNode33a runAction: movement33a];
        shapeNode33a.xScale = deltaMag33a;
        shapeNode33a.yScale = deltaMag33a;
        
        [shapeNode34a runAction: movement34a];
        shapeNode34a.xScale = deltaMag34a;
        shapeNode34a.yScale = deltaMag34a;
        
        [shapeNode35a runAction: movement35a];
        shapeNode35a.xScale = deltaMag35a;
        shapeNode35a.yScale = deltaMag35a;
        
        [shapeNode36a runAction: movement36a];
        shapeNode36a.xScale = deltaMag36a;
        shapeNode36a.yScale = deltaMag36a;
        
        [shapeNode37a runAction: movement37a];
        shapeNode37a.xScale = deltaMag37a;
        shapeNode37a.yScale = deltaMag37a;
        
        [shapeNode38a runAction: movement38a];
        shapeNode38a.xScale = deltaMag38a;
        shapeNode38a.yScale = deltaMag38a;
        
        [shapeNode39a runAction: movement39a];
        shapeNode39a.xScale = deltaMag39a;
        shapeNode39a.yScale = deltaMag39a;
        
        [shapeNode40a runAction: movement40a];
        shapeNode40a.xScale = deltaMag40a;
        shapeNode40a.yScale = deltaMag40a;
        
        [shapeNode41a runAction: movement41a];
        shapeNode41a.xScale = deltaMag41a;
        shapeNode41a.yScale = deltaMag41a;
        
        [shapeNode42a runAction: movement42a];
        shapeNode42a.xScale = deltaMag42a;
        shapeNode42a.yScale = deltaMag42a;
        
        [shapeNode43a runAction: movement43a];
        shapeNode43a.xScale = deltaMag43a;
        shapeNode43a.yScale = deltaMag43a;
        
        [shapeNode44a runAction: movement44a];
        shapeNode44a.xScale = deltaMag44a;
        shapeNode44a.yScale = deltaMag44a;
        
        [shapeNode45a runAction: movement45a];
        shapeNode45a.xScale = deltaMag45a;
        shapeNode45a.yScale = deltaMag45a;
        
        [shapeNode46a runAction: movement46a];
        shapeNode46a.xScale = deltaMag46a;
        shapeNode46a.yScale = deltaMag46a;
        
        [shapeNode47a runAction: movement47a];
        shapeNode47a.xScale = deltaMag47a;
        shapeNode47a.yScale = deltaMag47a;
    }
    
}

- (void) colorNodeLoop {
    
    float wavelengths[] = {wavlO5, wavlO2, wavlO1, wavlO13, wavlO28, wavlO11, wavlO9};
    
    for (int i = 0; i < 7; i++) {
        float wavelengthVar = wavelengths[i];
        
        [FallingIntoBHScene colorShift:wavelengthVar returnBlock:^(float red, float green, float blue) {
            
            redVar = red;
            greenVar = green;
            blueVar = blue;
        }];
        
        if (wavelengthVar == wavlO5) {
            colorO = [UIColor colorWithRed: redVar/255.0f green:greenVar/255.0f blue:blueVar/255.0f alpha:1.0]; //blue
        }
        if (wavelengthVar == wavlO2) {
            colorB = [UIColor colorWithRed: redVar/255.0f green:greenVar/255.0f blue:blueVar/255.0f alpha:1.0]; //deep blue white
        }
        if (wavelengthVar == wavlO1) {
            colorA = [UIColor colorWithRed: redVar/255.0f green:greenVar/255.0f blue:blueVar/255.0f alpha:1.0]; //blue white
        }
        if (wavelengthVar == wavlO13) {
            colorF = [UIColor colorWithRed: redVar/255.0f green:greenVar/255.0f blue:blueVar/255.0f alpha:1.0]; //white
        }
        if (wavelengthVar == wavlO28) {
            colorG = [UIColor colorWithRed: redVar/255.0f green:greenVar/255.0f blue:blueVar/255.0f alpha:1.0]; //yellowish white
        }
        if (wavelengthVar == wavlO11) {
            colorK = [UIColor colorWithRed: redVar/255.0f green:greenVar/255.0f blue:blueVar/255.0f alpha:1.0]; //pale yellow orange
        }
        if (wavelengthVar == wavlO9) {
            colorM = [UIColor colorWithRed: redVar/255.0f green:greenVar/255.0f blue:blueVar/255.0f alpha:1.0]; //light orange red
        }
    }
    
}

- (void) initialDistance {
    
    dfx1i = (xOrigin1 - BHPosX) * 0.001147;
    dfy1i = (yOrigin1 - BHPosY) * 0.001147;
    delta1i = sqrt(pow(dfx1i, 2) + pow(dfy1i, 2));
    
    dfx2i = (xOrigin2 - BHPosX) * 0.001147;
    dfy2i = (yOrigin2 - BHPosY) * 0.001147;
    delta2i = sqrt(pow(dfx2i, 2) + pow(dfy2i, 2));
    
    dfx3i = (xOrigin3 - BHPosX) * 0.001147;
    dfy3i = (yOrigin3 - BHPosY) * 0.001147;
    delta3i = sqrt(pow(dfx3i, 2) + pow(dfy3i, 2));
    
    dfx4i = (xOrigin4 - BHPosX) * 0.001147;
    dfy4i = (yOrigin4 - BHPosY) * 0.001147;
    delta4i = sqrt(pow(dfx4i, 2) + pow(dfy4i, 2));
    
    dfx5i = (xOrigin5 - BHPosX) * 0.001147;
    dfy5i = (yOrigin5 - BHPosY) * 0.001147;
    delta5i = sqrt(pow(dfx5i, 2) + pow(dfy5i, 2));
    
    dfx6i = (xOrigin6 - BHPosX) * 0.001147;
    dfy6i = (yOrigin6 - BHPosY) * 0.001147;
    delta6i = sqrt(pow(dfx6i, 2) + pow(dfy6i, 2));
    
    dfx7i = (xOrigin7 - BHPosX) * 0.001147;
    dfy7i = (yOrigin7 - BHPosY) * 0.001147;
    delta7i = sqrt(pow(dfx7i, 2) + pow(dfy7i, 2));
    
    dfx8i = (xOrigin8 - BHPosX) * 0.001147;
    dfy8i = (yOrigin8 - BHPosY) * 0.001147;
    delta8i = sqrt(pow(dfx8i, 2) + pow(dfy8i, 2));
    
    dfx9i = (xOrigin9 - BHPosX) * 0.001147;
    dfy9i = (yOrigin9 - BHPosY) * 0.001147;
    delta9i = sqrt(pow(dfx9i, 2) + pow(dfy9i, 2));
    
    dfx10i = (xOrigin10 - BHPosX) * 0.001147;
    dfy10i = (yOrigin10 - BHPosY) * 0.001147;
    delta10i = sqrt(pow(dfx10i, 2) + pow(dfy10i, 2));
    
    dfx11i = (xOrigin11 - BHPosX) * 0.001147;
    dfy11i = (yOrigin11 - BHPosY) * 0.001147;
    delta11i = sqrt(pow(dfx11i, 2) + pow(dfy11i, 2));
    
    dfx12i = (xOrigin12 - BHPosX) * 0.001147;
    dfy12i = (yOrigin12 - BHPosY) * 0.001147;
    delta12i = sqrt(pow(dfx12i, 2) + pow(dfy12i, 2));
    
    dfx13i = (xOrigin13 - BHPosX) * 0.001147;
    dfy13i = (yOrigin13 - BHPosY) * 0.001147;
    delta13i = sqrt(pow(dfx13i, 2) + pow(dfy13i, 2));
    
    dfx14i = (xOrigin14 - BHPosX) * 0.001147;
    dfy14i = (yOrigin14 - BHPosY) * 0.001147;
    delta14i = sqrt(pow(dfx14i, 2) + pow(dfy14i, 2));
    
    dfx15i = (xOrigin15 - BHPosX) * 0.001147;
    dfy15i = (yOrigin15 - BHPosY) * 0.001147;
    delta15i = sqrt(pow(dfx15i, 2) + pow(dfy15i, 2));
    
    dfx16i = (xOrigin16 - BHPosX) * 0.001147;
    dfy16i = (yOrigin16 - BHPosY) * 0.001147;
    delta16i = sqrt(pow(dfx16i, 2) + pow(dfy16i, 2));
    
    dfx17i = (xOrigin17 - BHPosX) * 0.001147;
    dfy17i = (yOrigin17 - BHPosY) * 0.001147;
    delta17i = sqrt(pow(dfx17i, 2) + pow(dfy17i, 2));
    
    dfx18i = (xOrigin18 - BHPosX) * 0.001147;
    dfy18i = (yOrigin18 - BHPosY) * 0.001147;
    delta18i = sqrt(pow(dfx18i, 2) + pow(dfy18i, 2));
    
    dfx19i = (xOrigin19 - BHPosX) * 0.001147;
    dfy19i = (yOrigin19 - BHPosY) * 0.001147;
    delta19i = sqrt(pow(dfx19i, 2) + pow(dfy19i, 2));
    
    dfx20i = (xOrigin20 - BHPosX) * 0.001147;
    dfy20i = (yOrigin20 - BHPosY) * 0.001147;
    delta20i = sqrt(pow(dfx20i, 2) + pow(dfy20i, 2));
    
    dfx21i = (xOrigin21 - BHPosX) * 0.001147;
    dfy21i = (yOrigin21 - BHPosY) * 0.001147;
    delta21i = sqrt(pow(dfx21i, 2) + pow(dfy21i, 2));
    
    dfx22i = (xOrigin22 - BHPosX) * 0.001147;
    dfy22i = (yOrigin22 - BHPosY) * 0.001147;
    delta22i = sqrt(pow(dfx22i, 2) + pow(dfy22i, 2));
    
    dfx23i = (xOrigin23 - BHPosX) * 0.001147;
    dfy23i = (yOrigin23 - BHPosY) * 0.001147;
    delta23i = sqrt(pow(dfx23i, 2) + pow(dfy23i, 2));
    
    dfx24i = (xOrigin24 - BHPosX) * 0.001147;
    dfy24i = (yOrigin24 - BHPosY) * 0.001147;
    delta24i = sqrt(pow(dfx24i, 2) + pow(dfy24i, 2));
    
    dfx25i = (xOrigin25 - BHPosX) * 0.001147;
    dfy25i = (yOrigin25 - BHPosY) * 0.001147;
    delta25i = sqrt(pow(dfx25i, 2) + pow(dfy25i, 2));
    
    dfx26i = (xOrigin26 - BHPosX) * 0.001147;
    dfy26i = (yOrigin26 - BHPosY) * 0.001147;
    delta26i = sqrt(pow(dfx26i, 2) + pow(dfy26i, 2));
    
    dfx27i = (xOrigin27 - BHPosX) * 0.001147;
    dfy27i = (yOrigin27 - BHPosY) * 0.001147;
    delta27i = sqrt(pow(dfx27i, 2) + pow(dfy27i, 2));
    
    dfx28i = (xOrigin28 - BHPosX) * 0.001147;
    dfy28i = (yOrigin28 - BHPosY) * 0.001147;
    delta28i = sqrt(pow(dfx28i, 2) + pow(dfy28i, 2));
    
    dfx29i = (xOrigin29 - BHPosX) * 0.001147;
    dfy29i = (yOrigin29 - BHPosY) * 0.001147;
    delta29i = sqrt(pow(dfx29i, 2) + pow(dfy29i, 2));
    
    dfx30i = (xOrigin30 - BHPosX) * 0.001147;
    dfy30i = (yOrigin30 - BHPosY) * 0.001147;
    delta30i = sqrt(pow(dfx30i, 2) + pow(dfy30i, 2));
    
    dfx31i = (xOrigin31 - BHPosX) * 0.001147;
    dfy31i = (yOrigin31 - BHPosY) * 0.001147;
    delta31i = sqrt(pow(dfx31i, 2) + pow(dfy31i, 2));
    
    dfx32i = (xOrigin32 - BHPosX) * 0.001147;
    dfy32i = (yOrigin32 - BHPosY) * 0.001147;
    delta32i = sqrt(pow(dfx32i, 2) + pow(dfy32i, 2));
    
    dfx33i = (xOrigin33 - BHPosX) * 0.001147;
    dfy33i = (yOrigin33 - BHPosY) * 0.001147;
    delta33i = sqrt(pow(dfx33i, 2) + pow(dfy33i, 2));
    
    dfx34i = (xOrigin34 - BHPosX) * 0.001147;
    dfy34i = (yOrigin34 - BHPosY) * 0.001147;
    delta34i = sqrt(pow(dfx34i, 2) + pow(dfy34i, 2));
    
    dfx35i = (xOrigin35 - BHPosX) * 0.001147;
    dfy35i = (yOrigin35 - BHPosY) * 0.001147;
    delta35i = sqrt(pow(dfx35i, 2) + pow(dfy35i, 2));
    
    dfx36i = (xOrigin36 - BHPosX) * 0.001147;
    dfy36i = (yOrigin36 - BHPosY) * 0.001147;
    delta36i = sqrt(pow(dfx36i, 2) + pow(dfy36i, 2));
    
    dfx37i = (xOrigin37 - BHPosX) * 0.001147;
    dfy37i = (yOrigin37 - BHPosY) * 0.001147;
    delta37i = sqrt(pow(dfx37i, 2) + pow(dfy37i, 2));
    
    dfx38i = (xOrigin38 - BHPosX) * 0.001147;
    dfy38i = (yOrigin38 - BHPosY) * 0.001147;
    delta38i = sqrt(pow(dfx38i, 2) + pow(dfy38i, 2));
    
    dfx39i = (xOrigin39 - BHPosX) * 0.001147;
    dfy39i = (yOrigin39 - BHPosY) * 0.001147;
    delta39i = sqrt(pow(dfx39i, 2) + pow(dfy39i, 2));
    
    dfx40i = (xOrigin40 - BHPosX) * 0.001147;
    dfy40i = (yOrigin40 - BHPosY) * 0.001147;
    delta40i = sqrt(pow(dfx40i, 2) + pow(dfy40i, 2));
    
    dfx41i = (xOrigin41 - BHPosX) * 0.001147;
    dfy41i = (yOrigin41 - BHPosY) * 0.001147;
    delta41i = sqrt(pow(dfx41i, 2) + pow(dfy41i, 2));
    
    dfx42i = (xOrigin42 - BHPosX) * 0.001147;
    dfy42i = (yOrigin42 - BHPosY) * 0.001147;
    delta42i = sqrt(pow(dfx42i, 2) + pow(dfy42i, 2));
    
    dfx43i = (xOrigin43 - BHPosX) * 0.001147;
    dfy43i = (yOrigin43 - BHPosY) * 0.001147;
    delta43i = sqrt(pow(dfx43i, 2) + pow(dfy43i, 2));
    
    dfx44i = (xOrigin44 - BHPosX) * 0.001147;
    dfy44i = (yOrigin44 - BHPosY) * 0.001147;
    delta44i = sqrt(pow(dfx44i, 2) + pow(dfy44i, 2));
    
    dfx45i = (xOrigin45 - BHPosX) * 0.001147;
    dfy45i = (yOrigin45 - BHPosY) * 0.001147;
    delta45i = sqrt(pow(dfx45i, 2) + pow(dfy45i, 2));
    
    dfx46i = (xOrigin46 - BHPosX) * 0.001147;
    dfy46i = (yOrigin46 - BHPosY) * 0.001147;
    delta46i = sqrt(pow(dfx46i, 2) + pow(dfy46i, 2));
    
    dfx47i = (xOrigin47 - BHPosX) * 0.001147;
    dfy47i = (yOrigin47 - BHPosY) * 0.001147;
    delta47i = sqrt(pow(dfx47i, 2) + pow(dfy47i, 2));
    
    //Ambient stars
    dfx1ia = (xOrigin1a - BHPosX) * 0.001147;
    dfy1ia = (yOrigin1a - BHPosY) * 0.001147;
    delta1ia = sqrt(pow(dfx1ia, 2) + pow(dfy1ia, 2));
    
    dfx2ia = (xOrigin2a - BHPosX) * 0.001147;
    dfy2ia = (yOrigin2a - BHPosY) * 0.001147;
    delta2ia = sqrt(pow(dfx2ia, 2) + pow(dfy2ia, 2));
    
    dfx3ia = (xOrigin3a - BHPosX) * 0.001147;
    dfy3ia = (yOrigin3a - BHPosY) * 0.001147;
    delta3ia = sqrt(pow(dfx3ia, 2) + pow(dfy3ia, 2));
    
    dfx4ia = (xOrigin4a - BHPosX) * 0.001147;
    dfy4ia = (yOrigin4a - BHPosY) * 0.001147;
    delta4ia = sqrt(pow(dfx4ia, 2) + pow(dfy4ia, 2));
    
    dfx5ia = (xOrigin5a - BHPosX) * 0.001147;
    dfy5ia = (yOrigin5a - BHPosY) * 0.001147;
    delta5ia = sqrt(pow(dfx5ia, 2) + pow(dfy5ia, 2));
    
    dfx6ia = (xOrigin6a - BHPosX) * 0.001147;
    dfy6ia = (yOrigin6a - BHPosY) * 0.001147;
    delta6ia = sqrt(pow(dfx6ia, 2) + pow(dfy6ia, 2));
    
    dfx7ia = (xOrigin7a - BHPosX) * 0.001147;
    dfy7ia = (yOrigin7a - BHPosY) * 0.001147;
    delta7ia = sqrt(pow(dfx7ia, 2) + pow(dfy7ia, 2));
    
    dfx8ia = (xOrigin8a - BHPosX) * 0.001147;
    dfy8ia = (yOrigin8a - BHPosY) * 0.001147;
    delta8ia = sqrt(pow(dfx8ia, 2) + pow(dfy8ia, 2));
    
    dfx9ia = (xOrigin9a - BHPosX) * 0.001147;
    dfy9ia = (yOrigin9a - BHPosY) * 0.001147;
    delta9ia = sqrt(pow(dfx9ia, 2) + pow(dfy9ia, 2));
    
    dfx10ia = (xOrigin10a - BHPosX) * 0.001147;
    dfy10ia = (yOrigin10a - BHPosY) * 0.001147;
    delta10ia = sqrt(pow(dfx10ia, 2) + pow(dfy10ia, 2));
    
    dfx11ia = (xOrigin11a - BHPosX) * 0.001147;
    dfy11ia = (yOrigin11a - BHPosY) * 0.001147;
    delta11ia = sqrt(pow(dfx11ia, 2) + pow(dfy11ia, 2));
    
    dfx12ia = (xOrigin12a - BHPosX) * 0.001147;
    dfy12ia = (yOrigin12a - BHPosY) * 0.001147;
    delta12ia = sqrt(pow(dfx12ia, 2) + pow(dfy12ia, 2));
    
    dfx13ia = (xOrigin13a - BHPosX) * 0.001147;
    dfy13ia = (yOrigin13a - BHPosY) * 0.001147;
    delta13ia = sqrt(pow(dfx13ia, 2) + pow(dfy13ia, 2));
    
    dfx14ia = (xOrigin14a - BHPosX) * 0.001147;
    dfy14ia = (yOrigin14a - BHPosY) * 0.001147;
    delta14ia = sqrt(pow(dfx14ia, 2) + pow(dfy14ia, 2));
    
    dfx15ia = (xOrigin15a - BHPosX) * 0.001147;
    dfy15ia = (yOrigin15a - BHPosY) * 0.001147;
    delta15ia = sqrt(pow(dfx15ia, 2) + pow(dfy15ia, 2));
    
    dfx16ia = (xOrigin16a - BHPosX) * 0.001147;
    dfy16ia = (yOrigin16a - BHPosY) * 0.001147;
    delta16ia = sqrt(pow(dfx16ia, 2) + pow(dfy16ia, 2));
    
    dfx17ia = (xOrigin17a - BHPosX) * 0.001147;
    dfy17ia = (yOrigin17a - BHPosY) * 0.001147;
    delta17ia = sqrt(pow(dfx17ia, 2) + pow(dfy17ia, 2));
    
    dfx18ia = (xOrigin18a - BHPosX) * 0.001147;
    dfy18ia = (yOrigin18a - BHPosY) * 0.001147;
    delta18ia = sqrt(pow(dfx18ia, 2) + pow(dfy18ia, 2));
    
    dfx19ia = (xOrigin19a - BHPosX) * 0.001147;
    dfy19ia = (yOrigin19a - BHPosY) * 0.001147;
    delta19ia = sqrt(pow(dfx19ia, 2) + pow(dfy19ia, 2));
    
    dfx20ia = (xOrigin20a - BHPosX) * 0.001147;
    dfy20ia = (yOrigin20a - BHPosY) * 0.001147;
    delta20ia = sqrt(pow(dfx20ia, 2) + pow(dfy20ia, 2));
    
    dfx21ia = (xOrigin21a - BHPosX) * 0.001147;
    dfy21ia = (yOrigin21a - BHPosY) * 0.001147;
    delta21ia = sqrt(pow(dfx21ia, 2) + pow(dfy21ia, 2));
    
    dfx22ia = (xOrigin22a - BHPosX) * 0.001147;
    dfy22ia = (yOrigin22a - BHPosY) * 0.001147;
    delta22ia = sqrt(pow(dfx22ia, 2) + pow(dfy22ia, 2));
    
    dfx23ia = (xOrigin23a - BHPosX) * 0.001147;
    dfy23ia = (yOrigin23a - BHPosY) * 0.001147;
    delta23ia = sqrt(pow(dfx23ia, 2) + pow(dfy23ia, 2));
    
    dfx24ia = (xOrigin24a - BHPosX) * 0.001147;
    dfy24ia = (yOrigin24a - BHPosY) * 0.001147;
    delta24ia = sqrt(pow(dfx24ia, 2) + pow(dfy24ia, 2));
    
    dfx25ia = (xOrigin25a - BHPosX) * 0.001147;
    dfy25ia = (yOrigin25a - BHPosY) * 0.001147;
    delta25ia = sqrt(pow(dfx25ia, 2) + pow(dfy25ia, 2));
    
    dfx26ia = (xOrigin26a - BHPosX) * 0.001147;
    dfy26ia = (yOrigin26a - BHPosY) * 0.001147;
    delta26ia = sqrt(pow(dfx26ia, 2) + pow(dfy26ia, 2));
    
    dfx27ia = (xOrigin27a - BHPosX) * 0.001147;
    dfy27ia = (yOrigin27a - BHPosY) * 0.001147;
    delta27ia = sqrt(pow(dfx27ia, 2) + pow(dfy27ia, 2));
    
    dfx28ia = (xOrigin28a - BHPosX) * 0.001147;
    dfy28ia = (yOrigin28a - BHPosY) * 0.001147;
    delta28ia = sqrt(pow(dfx28ia, 2) + pow(dfy28ia, 2));
    
    dfx29ia = (xOrigin29a - BHPosX) * 0.001147;
    dfy29ia = (yOrigin29a - BHPosY) * 0.001147;
    delta29ia = sqrt(pow(dfx29ia, 2) + pow(dfy29ia, 2));
    
    dfx30ia = (xOrigin30a - BHPosX) * 0.001147;
    dfy30ia = (yOrigin30a - BHPosY) * 0.001147;
    delta30ia = sqrt(pow(dfx30ia, 2) + pow(dfy30ia, 2));
    
    dfx31ia = (xOrigin31a - BHPosX) * 0.001147;
    dfy31ia = (yOrigin31a - BHPosY) * 0.001147;
    delta31ia = sqrt(pow(dfx31ia, 2) + pow(dfy31ia, 2));
    
    dfx32ia = (xOrigin32a - BHPosX) * 0.001147;
    dfy32ia = (yOrigin32a - BHPosY) * 0.001147;
    delta32ia = sqrt(pow(dfx32ia, 2) + pow(dfy32ia, 2));
    
    dfx33ia = (xOrigin33a - BHPosX) * 0.001147;
    dfy33ia = (yOrigin33a - BHPosY) * 0.001147;
    delta33ia = sqrt(pow(dfx33ia, 2) + pow(dfy33ia, 2));
    
    dfx34ia = (xOrigin34a - BHPosX) * 0.001147;
    dfy34ia = (yOrigin34a - BHPosY) * 0.001147;
    delta34ia = sqrt(pow(dfx34ia, 2) + pow(dfy34ia, 2));
    
    dfx35ia = (xOrigin35a - BHPosX) * 0.001147;
    dfy35ia = (yOrigin35a - BHPosY) * 0.001147;
    delta35ia = sqrt(pow(dfx35ia, 2) + pow(dfy35ia, 2));
    
    dfx36ia = (xOrigin36a - BHPosX) * 0.001147;
    dfy36ia = (yOrigin36a - BHPosY) * 0.001147;
    delta36ia = sqrt(pow(dfx36ia, 2) + pow(dfy36ia, 2));
    
    dfx37ia = (xOrigin37a - BHPosX) * 0.001147;
    dfy37ia = (yOrigin37a - BHPosY) * 0.001147;
    delta37ia = sqrt(pow(dfx37ia, 2) + pow(dfy37ia, 2));
    
    dfx38ia = (xOrigin38a - BHPosX) * 0.001147;
    dfy38ia = (yOrigin38a - BHPosY) * 0.001147;
    delta38ia = sqrt(pow(dfx38ia, 2) + pow(dfy38ia, 2));
    
    dfx39ia = (xOrigin39a - BHPosX) * 0.001147;
    dfy39ia = (yOrigin39a - BHPosY) * 0.001147;
    delta39ia = sqrt(pow(dfx39ia, 2) + pow(dfy39ia, 2));
    
    dfx40ia = (xOrigin40a - BHPosX) * 0.001147;
    dfy40ia = (yOrigin40a - BHPosY) * 0.001147;
    delta40ia = sqrt(pow(dfx40ia, 2) + pow(dfy40ia, 2));
    
    dfx41ia = (xOrigin41a - BHPosX) * 0.001147;
    dfy41ia = (yOrigin41a - BHPosY) * 0.001147;
    delta41ia = sqrt(pow(dfx41ia, 2) + pow(dfy41ia, 2));
    
    dfx42ia = (xOrigin42a - BHPosX) * 0.001147;
    dfy42ia = (yOrigin42a - BHPosY) * 0.001147;
    delta42ia = sqrt(pow(dfx42ia, 2) + pow(dfy42ia, 2));
    
    dfx43ia = (xOrigin43a - BHPosX) * 0.001147;
    dfy43ia = (yOrigin43a - BHPosY) * 0.001147;
    delta43ia = sqrt(pow(dfx43ia, 2) + pow(dfy43ia, 2));
    
    dfx44ia = (xOrigin44a - BHPosX) * 0.001147;
    dfy44ia = (yOrigin44a - BHPosY) * 0.001147;
    delta44ia = sqrt(pow(dfx44ia, 2) + pow(dfy44ia, 2));
    
    dfx45ia = (xOrigin45a - BHPosX) * 0.001147;
    dfy45ia = (yOrigin45a - BHPosY) * 0.001147;
    delta45ia = sqrt(pow(dfx45ia, 2) + pow(dfy45ia, 2));
    
    dfx46ia = (xOrigin46a - BHPosX) * 0.001147;
    dfy46ia = (yOrigin46a - BHPosY) * 0.001147;
    delta46ia = sqrt(pow(dfx46ia, 2) + pow(dfy46ia, 2));
    
    dfx47ia = (xOrigin47a - BHPosX) * 0.001147;
    dfy47ia = (yOrigin47a - BHPosY) * 0.001147;
    delta47ia = sqrt(pow(dfx47ia, 2) + pow(dfy47ia, 2));
}

-(void) ambientNodes {
    
    shapeNode1a.position = CGPointMake(center.x - (([self getRandomWidth] + (sqrt(ambSize) / 2)) * cf), center.y - (([self getRandomHeight] + (sqrt(ambSize) / 2)) * cf));
    xOrigin1a = shapeNode1a.position.x + (sqrt(ambSize) / 2);
    yOrigin1a = shapeNode1a.position.y + (sqrt(ambSize) / 2);
    
    shapeNode2a.position = CGPointMake(center.x - (([self getRandomWidth] + (sqrt(ambSize) / 2)) * cf), center.y - (([self getRandomHeight] + (sqrt(ambSize) / 2)) * cf));
    xOrigin2a = shapeNode2a.position.x + (sqrt(ambSize) / 2);
    yOrigin2a = shapeNode2a.position.y + (sqrt(ambSize) / 2);
    
    shapeNode3a.position = CGPointMake(center.x - (([self getRandomWidth] + (sqrt(ambSize) / 2)) * cf), center.y - (([self getRandomHeight] + (sqrt(ambSize) / 2)) * cf));
    xOrigin3a = shapeNode3a.position.x + (sqrt(ambSize) / 2);
    yOrigin3a = shapeNode3a.position.y + (sqrt(ambSize) / 2);
    
    shapeNode4a.position = CGPointMake(center.x + (([self getRandomWidth] - (sqrt(ambSize) / 2)) * cf), center.y - (([self getRandomHeight] + (sqrt(4.75) / 2)) * cf));
    xOrigin4a = shapeNode4a.position.x + (sqrt(ambSize) / 2);
    yOrigin4a = shapeNode4a.position.y + (sqrt(ambSize) / 2);
    
    shapeNode5a.position = CGPointMake(center.x - (([self getRandomWidth] + (sqrt(ambSize) / 2)) * cf), center.y - (([self getRandomHeight] + (sqrt(ambSize) / 2)) * cf));
    xOrigin5a = shapeNode5a.position.x + (sqrt(ambSize) / 2);
    yOrigin5a = shapeNode5a.position.y + (sqrt(ambSize) / 2);
    
    shapeNode6a.position = CGPointMake(center.x - (([self getRandomWidth] + (sqrt(ambSize) / 2)) * cf), center.y - (([self getRandomHeight] + (sqrt(ambSize) / 2)) * cf));
    xOrigin6a = shapeNode6a.position.x + (sqrt(ambSize) / 2);
    yOrigin6a = shapeNode6a.position.y + (sqrt(ambSize) / 2);
    
    shapeNode7a.position = CGPointMake(center.x - (([self getRandomWidth] + (sqrt(ambSize) / 2)) * cf), center.y - (([self getRandomHeight] + (sqrt(ambSize) / 2)) * cf));
    xOrigin7a = shapeNode7a.position.x + (sqrt(ambSize) / 2);
    yOrigin7a = shapeNode7a.position.y + (sqrt(ambSize) / 2);
    
    shapeNode8a.position = CGPointMake(center.x + (([self getRandomWidth] + (sqrt(ambSize) / 2)) * cf), center.y + (([self getRandomHeight] + (sqrt(ambSize) / 2)) * cf));
    xOrigin8a = shapeNode8a.position.x + (sqrt(ambSize) / 2);
    yOrigin8a = shapeNode8a.position.y + (sqrt(ambSize) / 2);
    
    shapeNode9a.position = CGPointMake(center.x - (([self getRandomWidth] + (sqrt(ambSize) / 2)) * cf), center.y + (([self getRandomHeight] + (sqrt(ambSize) / 2)) * cf));
    xOrigin9a = shapeNode9a.position.x + (sqrt(ambSize) / 2);
    yOrigin9a = shapeNode9a.position.y + (sqrt(ambSize) / 2);
    
    shapeNode10a.position = CGPointMake(center.x - (([self getRandomWidth] + (sqrt(ambSize) / 2)) * cf), center.y + (([self getRandomHeight] + (sqrt(ambSize) / 2)) * cf));
    xOrigin10a = shapeNode10a.position.x  + (sqrt(ambSize) / 2);
    yOrigin10a = shapeNode10a.position.y + (sqrt(ambSize) / 2);
    
    shapeNode11a.position = CGPointMake(center.x + (([self getRandomWidth] + (sqrt(ambSize) / 2)) * cf), center.y + (([self getRandomHeight] + (sqrt(ambSize) / 2)) * cf));
    xOrigin11a = shapeNode11a.position.x  + (sqrt(ambSize) / 2);
    yOrigin11a = shapeNode11a.position.y  + (sqrt(ambSize) / 2);
    
    shapeNode12a.position = CGPointMake(center.x - (([self getRandomWidth] + (sqrt(ambSize) / 2)) * cf), center.y - (([self getRandomHeight] + (sqrt(ambSize)) / 2) * cf));
    xOrigin12a = shapeNode12a.position.x  + (sqrt(ambSize) / 2);
    yOrigin12a = shapeNode12a.position.y  + (sqrt(ambSize) / 2);
    
    shapeNode13a.position = CGPointMake(center.x - (([self getRandomWidth] + (sqrt(ambSize) / 2)) * cf), center.y - (([self getRandomHeight] + (sqrt(ambSize) / 2)) * cf));
    xOrigin13a = shapeNode13a.position.x + (sqrt(ambSize) / 2);
    yOrigin13a = shapeNode13a.position.y  + (sqrt(ambSize) / 2);
    
    shapeNode14a.position = CGPointMake(center.x - (([self getRandomWidth] + (sqrt(ambSize) / 2)) * cf), center.y - (([self getRandomHeight] + (sqrt(ambSize) / 2)) * cf));
    xOrigin14a = shapeNode14a.position.x  + (sqrt(ambSize) / 2);
    yOrigin14a = shapeNode14a.position.y  + (sqrt(ambSize) / 2);
    
    shapeNode15a.position = CGPointMake(center.x + (([self getRandomWidth] - (sqrt(ambSize) / 2)) * cf), center.y - (([self getRandomHeight] + (sqrt(ambSize)) / 2) * cf));
    xOrigin15a = shapeNode15a.position.x  + (sqrt(ambSize) / 2);
    yOrigin15a = shapeNode15a.position.y  + (sqrt(ambSize) / 2);
    
    shapeNode16a.position = CGPointMake(center.x + (([self getRandomWidth] - (sqrt(ambSize) / 2)) * cf), center.y - (([self getRandomHeight] + (sqrt(ambSize) / 2)) * cf));
    xOrigin16a = shapeNode16a.position.x  + (sqrt(ambSize) / 2);
    yOrigin16a = shapeNode16a.position.y  + (sqrt(ambSize) / 2);
    
    shapeNode17a.position = CGPointMake(center.x + (([self getRandomWidth] - (sqrt(ambSize) / 2)) * cf), center.y - (([self getRandomHeight] + (sqrt(ambSize) / 2)) * cf));
    xOrigin17a = shapeNode17a.position.x  + (sqrt(ambSize) / 2);
    yOrigin17a = shapeNode17a.position.y  + (sqrt(ambSize) / 2);
    
    shapeNode18a.position = CGPointMake(center.x + (([self getRandomWidth] - (sqrt(ambSize) / 2)) * cf), center.y - (([self getRandomHeight] + (sqrt(ambSize) / 2)) * cf));
    xOrigin18a = shapeNode18a.position.x  + (sqrt(ambSize) / 2);
    yOrigin18a = shapeNode18a.position.y  + (sqrt(ambSize) / 2);
    
    shapeNode19a.position = CGPointMake(center.x + (([self getRandomWidth] - (sqrt(ambSize) / 2)) * cf), center.y - (([self getRandomHeight] + (sqrt(ambSize) / 2)) * cf));
    xOrigin19a = shapeNode19a.position.x  + (sqrt(ambSize) / 2);
    yOrigin19a = shapeNode19a.position.y  + (sqrt(ambSize) / 2);
    
    shapeNode20a.position = CGPointMake(center.x + (([self getRandomWidth] - (sqrt(ambSize) / 2)) * cf), center.y - (([self getRandomHeight] + (sqrt(ambSize) / 2)) * cf));
    xOrigin20a = shapeNode20a.position.x  + (sqrt(ambSize) / 2);
    yOrigin20a = shapeNode20a.position.y  + (sqrt(ambSize) / 2);
    
    shapeNode21a.position = CGPointMake(center.x + (([self getRandomWidth] - (sqrt(ambSize) / 2)) * cf), center.y - (([self getRandomHeight] + (sqrt(ambSize) / 2)) * cf));
    xOrigin21a = shapeNode21a.position.x + (sqrt(ambSize) / 2);
    yOrigin21a = shapeNode21a.position.y + (sqrt(ambSize) / 2);
    
    shapeNode22a.position = CGPointMake(center.x + (([self getRandomWidth] - (sqrt(ambSize) / 2)) * cf), center.y - (([self getRandomHeight] + (sqrt(ambSize) / 2)) * cf));
    xOrigin22a = shapeNode22a.position.x + (sqrt(ambSize) / 2);
    yOrigin22a = shapeNode22a.position.y + (sqrt(ambSize) / 2);
    
    shapeNode23a.position = CGPointMake(center.x - (([self getRandomWidth] + (sqrt(ambSize) / 2)) * cf), center.y + (([self getRandomHeight] - (sqrt(ambSize) / 2)) * cf));
    xOrigin23a = shapeNode23a.position.x + (sqrt(ambSize) / 2);
    yOrigin23a = shapeNode23a.position.y + (sqrt(ambSize) / 2);
    
    shapeNode24a.position = CGPointMake(center.x - (([self getRandomWidth] + (sqrt(ambSize) / 2)) * cf), center.y + (([self getRandomHeight] -  (sqrt(ambSize) / 2)) * cf));
    xOrigin24a = shapeNode24a.position.x + (sqrt(ambSize) / 2);
    yOrigin24a = shapeNode24a.position.y + (sqrt(ambSize) / 2);
    
    shapeNode25a.position = CGPointMake(center.x - (([self getRandomWidth] + (sqrt(ambSize) / 2)) * cf), center.y + (([self getRandomHeight] - (sqrt(ambSize) / 2)) * cf));
    xOrigin25a = shapeNode25a.position.x + (sqrt(ambSize) / 2);
    yOrigin25a = shapeNode25a.position.y + (sqrt(ambSize) / 2);
    
    shapeNode26a.position = CGPointMake(center.x - (([self getRandomWidth] + (sqrt(ambSize) / 2)) * cf), center.y + (([self getRandomHeight] - (sqrt(ambSize) / 2)) * cf));
    xOrigin26a = shapeNode26a.position.x + (sqrt(ambSize) / 2);
    yOrigin26a = shapeNode26a.position.y + (sqrt(ambSize) / 2);
    
    shapeNode27a.position = CGPointMake(center.x - (([self getRandomWidth] + (sqrt(ambSize) / 2)) * cf), center.y + (([self getRandomHeight] - (sqrt(ambSize) / 2)) * cf));
    xOrigin27a = shapeNode27a.position.x + (sqrt(ambSize) / 2);
    yOrigin27a = shapeNode27a.position.y + (sqrt(ambSize) / 2);
    
    shapeNode28a.position = CGPointMake(center.x - (([self getRandomWidth] + (sqrt(ambSize) / 2)) * cf), center.y + (([self getRandomHeight] - (sqrt(ambSize) / 2)) * cf));
    xOrigin28a = shapeNode28a.position.x + (sqrt(ambSize) / 2);
    yOrigin28a = shapeNode28a.position.y + (sqrt(ambSize) / 2);
    
    shapeNode29a.position = CGPointMake(center.x - (([self getRandomWidth] + (sqrt(ambSize) / 2)) * cf), center.y - (([self getRandomHeight] + (sqrt(ambSize) / 2)) * cf));
    xOrigin29a = shapeNode29a.position.x + (sqrt(ambSize) / 2);
    yOrigin29a = shapeNode29a.position.y + (sqrt(ambSize) / 2);
    
    shapeNode30a.position = CGPointMake(center.x - (([self getRandomWidth] + (sqrt(ambSize) / 2)) * cf), center.y - (([self getRandomHeight] + (sqrt(ambSize) / 2)) * cf));
    xOrigin30a = shapeNode30a.position.x + (sqrt(ambSize) / 2);
    yOrigin30a = shapeNode30a.position.y + (sqrt(ambSize) / 2);
    
    shapeNode31a.position = CGPointMake(center.x - (([self getRandomWidth] + (sqrt(ambSize) / 2)) * cf), center.y + (([self getRandomHeight] + (sqrt(ambSize) / 2)) * cf));
    xOrigin31a = shapeNode31a.position.x + (sqrt(ambSize) / 2);
    yOrigin31a = shapeNode31a.position.y + (sqrt(ambSize) / 2);
    
    shapeNode32a.position = CGPointMake(center.x - (([self getRandomWidth] + (sqrt(ambSize) / 2)) * cf), center.y + (([self getRandomHeight] - (sqrt(ambSize) / 2)) * cf));
    xOrigin32a = shapeNode32a.position.x + (sqrt(ambSize) / 2);
    yOrigin32a = shapeNode32a.position.y + (sqrt(ambSize) / 2);
    
    shapeNode33a.position = CGPointMake(center.x - (([self getRandomWidth] + (sqrt(ambSize) / 2)) * cf), center.y + (([self getRandomHeight] - (sqrt(ambSize) / 2)) * cf));
    xOrigin33a = shapeNode33a.position.x + (sqrt(ambSize) / 2);
    yOrigin33a = shapeNode33a.position.y + (sqrt(ambSize) / 2);
    
    shapeNode34a.position = CGPointMake(center.x - (([self getRandomWidth] + (sqrt(ambSize) / 2)) * cf), center.y + (([self getRandomHeight] - (sqrt(ambSize) / 2)) * cf));
    xOrigin34a = shapeNode34a.position.x + (sqrt(ambSize) / 2);
    yOrigin34a = shapeNode34a.position.y + (sqrt(ambSize) / 2);
    
    shapeNode35a.position = CGPointMake(center.x - (([self getRandomWidth] + (sqrt(ambSize) / 2)) * cf), center.y + (([self getRandomHeight] - (sqrt(ambSize) / 2)) * cf));
    xOrigin35a = shapeNode35a.position.x + (sqrt(ambSize) / 2);
    yOrigin35a = shapeNode35a.position.y + (sqrt(ambSize) / 2);
    
    shapeNode36a.position = CGPointMake(center.x + (([self getRandomWidth] - (sqrt(ambSize) / 2)) * cf), center.y + (([self getRandomHeight] - (sqrt(ambSize) / 2)) * cf));
    xOrigin36a = shapeNode36a.position.x + (sqrt(ambSize) / 2);
    yOrigin36a = shapeNode36a.position.y + (sqrt(ambSize) / 2);
    
    shapeNode37a.position = CGPointMake(center.x + (([self getRandomWidth] - (sqrt(ambSize) / 2)) * cf), center.y + (([self getRandomHeight] - (sqrt(ambSize) / 2)) * cf));
    xOrigin37a = shapeNode37a.position.x + (sqrt(ambSize) / 2);
    yOrigin37a = shapeNode37a.position.y + (sqrt(ambSize) / 2);
    
    shapeNode38a.position = CGPointMake(center.x + (([self getRandomWidth] - (sqrt(ambSize) / 2)) * cf), center.y + (([self getRandomHeight] - (sqrt(ambSize) / 2)) * cf));
    xOrigin38a = shapeNode38a.position.x + (sqrt(ambSize) / 2);
    yOrigin38a = shapeNode38a.position.y + (sqrt(ambSize) / 2);
    
    shapeNode39a.position = CGPointMake(center.x + (([self getRandomWidth] - (sqrt(ambSize) / 2)) * cf), center.y + (([self getRandomHeight] - (sqrt(ambSize) / 2)) * cf));
    xOrigin39a = shapeNode39a.position.x + (sqrt(ambSize) / 2);
    yOrigin39a = shapeNode39a.position.y + (sqrt(ambSize) / 2);
    
    shapeNode40a.position = CGPointMake(center.x + (([self getRandomWidth] - (sqrt(ambSize) / 2)) * cf), center.y + (([self getRandomHeight] - (sqrt(ambSize) / 2)) * cf));
    xOrigin40a = shapeNode40a.position.x + (sqrt(ambSize) / 2);
    yOrigin40a = shapeNode40a.position.y + (sqrt(ambSize) / 2);
    
    shapeNode41a.position = CGPointMake(center.x + (([self getRandomWidth] - (sqrt(ambSize) / 2)) * cf), center.y + (([self getRandomHeight] - (sqrt(ambSize) / 2)) * cf));
    xOrigin41a = shapeNode41a.position.x + (sqrt(ambSize) / 2);
    yOrigin41a = shapeNode41a.position.y + (sqrt(ambSize) / 2);
    
    shapeNode42a.position = CGPointMake(center.x + (([self getRandomWidth] - (sqrt(ambSize) / 2)) * cf), center.y + (([self getRandomHeight] - (sqrt(ambSize) / 2)) * cf));
    xOrigin42a = shapeNode42a.position.x + (sqrt(ambSize) / 2);
    yOrigin42a = shapeNode42a.position.y + (sqrt(ambSize) / 2);
    
    shapeNode43a.position = CGPointMake(center.x + (([self getRandomWidth] - (sqrt(ambSize) / 2)) * cf), center.y + (([self getRandomHeight] - (sqrt(ambSize) / 2)) * cf));
    xOrigin43a = shapeNode43a.position.x + (sqrt(ambSize) / 2);
    yOrigin43a = shapeNode43a.position.y + (sqrt(ambSize) / 2);
    
    shapeNode44a.position = CGPointMake(center.x + (([self getRandomWidth] - (sqrt(ambSize) / 2)) * cf), center.y + (([self getRandomHeight] - (sqrt(ambSize) / 2)) * cf));
    xOrigin44a = shapeNode44a.position.x + (sqrt(ambSize) / 2);
    yOrigin44a = shapeNode44a.position.y + (sqrt(ambSize) / 2);
    
    shapeNode45a.position = CGPointMake(center.x + (([self getRandomWidth] - (sqrt(ambSize) / 2)) * cf), center.y + (([self getRandomHeight] - (sqrt(ambSize) / 2)) * cf));
    xOrigin45a = shapeNode45a.position.x + (sqrt(ambSize) / 2);
    yOrigin45a = shapeNode45a.position.y + (sqrt(ambSize) / 2);
    
    shapeNode46a.position = CGPointMake(center.x + (([self getRandomWidth] - (sqrt(ambSize) / 2)) * cf), center.y + (([self getRandomHeight] - (sqrt(ambSize) / 2)) * cf));
    xOrigin46a = shapeNode46a.position.x + (sqrt(ambSize) / 2);
    yOrigin46a = shapeNode46a.position.y + (sqrt(ambSize) / 2);
    
    shapeNode47a.position = CGPointMake(center.x - (([self getRandomWidth] - (sqrt(ambSize) / 2)) * cf), center.y - (([self getRandomHeight] + (sqrt(ambSize) / 2)) * cf));
    xOrigin47a = shapeNode47a.position.x + (sqrt(ambSize) / 2);
    yOrigin47a = shapeNode47a.position.y + (sqrt(ambSize) / 2);
}

- (float)getRandomWidth
{
    int maximum = 80;
    int minimum = 0;
    float total = minimum + arc4random() % (maximum - minimum + 1);
    //NSLog(@" getRandomWidth %f", total);
    return total;
}

- (float)getRandomHeight
{
    int maximum = 65;
    int minimum = 0;
    float total = minimum + arc4random() % (maximum - minimum + 1);
    //NSLog(@" getRandomHeight %f", total);
    return total;
}
@end

