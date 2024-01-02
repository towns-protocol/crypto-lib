/********************************************************************************************/
/*
/*     ___                _   _       ___               _         _    _ _    
/*    / __|_ __  ___  ___| |_| |_    / __|_ _ _  _ _ __| |_ ___  | |  (_) |__ 
/*    \__ \ '  \/ _ \/ _ \  _| ' \  | (__| '_| || | '_ \  _/ _ \ | |__| | '_ \
/*   |___/_|_|_\___/\___/\__|_||_|  \___|_|  \_, | .__/\__\___/ |____|_|_.__/
/*                                         |__/|_|           
/*              
/* Copyright (C) 2023 - Renaud Dubois - This file is part of SCL (Smooth CryptoLib) project
/* License: This software is licensed under MIT License                                        
/********************************************************************************************/

// SPDX-License-Identifier: MIT
pragma solidity >=0.8.19 <0.9.0;

import {_UNUSED, _SECP256R1} from "@solidity/include/SCL_mask.h.sol";

// prime field modulus of the secp256r1 curve
uint256 constant p = 0xFFFFFFFF00000001000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFF;
// short weierstrass first coefficient
uint256 constant a = 0xFFFFFFFF00000001000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFC;
// short weierstrass second coefficient
uint256 constant b = 0x5AC635D8AA3A93E7B3EBBD55769886BC651D06B0CC53B0F63BCE3C3E27D2604B;
// the affine coordinates of the generating point on the curve
//48439561293906451759052585252797914202762949526041747995844080717082404635286
uint256 constant gx = 0x6B17D1F2E12C4247F8BCE6E563A440F277037D812DEB33A0F4A13945D898C296;
//36134250956749795798585127919587881956611106672985015071877198253568414405109
uint256 constant gy = 0x4FE342E2FE1A7F9B8EE7EB4A7C0F9E162BCE33576B315ECECBB6406837BF51F5;
// the order of the curve, i.e., the number of points on the curve
uint256 constant n = 0xFFFFFFFF00000000FFFFFFFFFFFFFFFFBCE6FAADA7179E84F3B9CAC2FC632551;

/*//////////////////////////////////////////////////////////////
                            CONSTANTS
//////////////////////////////////////////////////////////////*/

// -2 mod(p), used to accelerate inversion and doubling operations by avoiding negation
uint256 constant pMINUS_2 = 0xFFFFFFFF00000001000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFD;
// -2 mod(n), used to speed up inversion operations
uint256 constant nMINUS_2 = 0xFFFFFFFF00000000FFFFFFFFFFFFFFFFBCE6FAADA7179E84F3B9CAC2FC63254F;

//precomputed 2^128.G
//0x447d739beedb5e67fb982fd588c6766efc35ff7dc297eac357c84fc9d789bd85
uint256 constant gpow2p128_x = 30978927491535595270285342502287618780579786685182435011955893029189825707397;
uint256 constant gpow2p128_y= 20481551163499472379222416201371726725754635744576161296521936142531318405938;
uint256 constant _HIBIT_CURVE=255;
uint256 constant FIELD_OID=_SECP256R1;
 //P+1 div 4, used for sqrtmod computation
 uint256 constant pp1div4=0x3fffffffc0000000400000000000000000000000400000000000000000000000;

uint256 constant   _MODEXP_PRECOMPILE=0x05;
// the representation of -1 over 256 bits
uint256 constant MINUS_1 = 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF;


uint256 constant d=  _UNUSED;
uint256 constant deux_d = _UNUSED;
uint256 constant unscaling_factor= _UNUSED;
uint256 constant scaling_factor= _UNUSED;


uint256 constant _2gx=56515219790691171413109057904011688695424810155802929973526481321309856242040;
uint256 constant _2gy=3377031843712258259223711451491452598088675519751548567112458094635497583569;
uint256 constant _3gx=42877656971275811310262564894490210024759287182177196162425349131675946712428;
uint256 constant _3gy=61154801112014214504178281461992570017247172004704277041681093927569603776562;
uint256 constant _4gx=102369864249653057322725350723741461599905180004905897298779971437827381725266;
uint256 constant _4gy=101744491111635190512325668403432589740384530506764148840112137220732283181254;

uint256 constant _5gx=56515219790691171413109057904011688695424810155802929973526481321309856242040;
uint256 constant _5gy=3377031843712258259223711451491452598088675519751548567112458094635497583569;
uint256 constant _6gx=56515219790691171413109057904011688695424810155802929973526481321309856242040;
uint256 constant _6gy=3377031843712258259223711451491452598088675519751548567112458094635497583569;
uint256 constant _7gx=56515219790691171413109057904011688695424810155802929973526481321309856242040;
uint256 constant _7gy=3377031843712258259223711451491452598088675519751548567112458094635497583569;
uint256 constant _8gx=56515219790691171413109057904011688695424810155802929973526481321309856242040;
uint256 constant _8gy=3377031843712258259223711451491452598088675519751548567112458094635497583569;
uint256 constant _9gx=56515219790691171413109057904011688695424810155802929973526481321309856242040;
uint256 constant _9gy=3377031843712258259223711451491452598088675519751548567112458094635497583569;
uint256 constant _10gx=56515219790691171413109057904011688695424810155802929973526481321309856242040;
uint256 constant _10gy=3377031843712258259223711451491452598088675519751548567112458094635497583569;
uint256 constant _11gx=56515219790691171413109057904011688695424810155802929973526481321309856242040;
uint256 constant _11gy=3377031843712258259223711451491452598088675519751548567112458094635497583569;
uint256 constant _12gx=56515219790691171413109057904011688695424810155802929973526481321309856242040;
uint256 constant _12gy=3377031843712258259223711451491452598088675519751548567112458094635497583569;
uint256 constant _13gx=56515219790691171413109057904011688695424810155802929973526481321309856242040;
uint256 constant _13gy=3377031843712258259223711451491452598088675519751548567112458094635497583569;
uint256 constant _14gx=56515219790691171413109057904011688695424810155802929973526481321309856242040;
uint256 constant _14gy=3377031843712258259223711451491452598088675519751548567112458094635497583569;
uint256 constant _15gx=56515219790691171413109057904011688695424810155802929973526481321309856242040;
uint256 constant _15gy=3377031843712258259223711451491452598088675519751548567112458094635497583569;





/*_G_POINT*2
(56515219790691171413109057904011688695424810155802929973526481321309856242040 : 3377031843712258259223711451491452598088675519751548567112458094635497583569 : 1)
sage: _G_POINT*3
(42877656971275811310262564894490210024759287182177196162425349131675946712428 : 61154801112014214504178281461992570017247172004704277041681093927569603776562 : 1)
sage: _G_POINT*4
(102369864249653057322725350723741461599905180004905897298779971437827381725266 : 101744491111635190512325668403432589740384530506764148840112137220732283181254 : 1)
sage: _G_POINT*5
(36794669340896883012101473439538929759152396476648692591795318194054580155373 : 101659946828913883886577915207667153874746613498030835602133042203824767462820 : 1)
sage: _G_POINT*6
(79653159259317329199152975905021693207262715618295428672027927511489832980905 : 105099244361861367422779349381909628134794498213392835359532911141293690159074 : 1)
sage: _G_POINT*7
(64375483017717711348634889601793836329966447963510648681625681211348943876771 : 52431391916983504423217627849020916729601969409053901192561322805962577543348 : 1)
sage: _G_POINT*8
(44710890534849379681007195543719586089737754824560621976448707498688874787731 : 78410552107786285403689301656392479612049391334024095564584156230482213311870 : 1)
sage: _G_POINT*9
(106026447472237217594103756757091873528548576106367144586170196380839010672352 : 19066521425813101412078385704618669688199787690556935461623958781864528857338 : 1)
sage: _G_POINT*10
(93611846365601674425599200647886473617443872040541410036779615417472400060991 : 61299672808462629900136024686264045542397545919962042795596947287593974695795 : 1)
sage: _G_POINT*11
(28412803729898893058558238221310261427084375743576167377786533380249859400145 : 65403602826180996396520286939226973026599920614829401631985882360676038096704 : 1)
sage: _G_POINT*12
(52521004185641536627266600536804816931535329133355539962020980193802383057860 : 3365321999886721389269937144276711091585627196865605815969312301872807444947 : 1)
sage: _G_POINT*13
(10623191994993397449217730442198332685419647040822028787120372345201232391169 : 45109985299617300571846506882481132822837374452436097494820998411881657384920 : 1)
sage: _G_POINT*14
(38403262968984431726992065809397801166868659563255596809893498026441953153547 : 111088643870609220449345638248812642769306967281233677460251511569904126964597 : 1)
sage: _G_POINT*15
(108677532895904936863904823330600106055145041255062888673713681538132314135903 : 82195926338128401624329850334826772981689991100719104119047727086732126146358 : 1)



*/