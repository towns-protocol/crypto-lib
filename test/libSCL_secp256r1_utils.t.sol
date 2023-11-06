/********************************************************************************************/
/*
/*     ___                _   _       ___               _         _    _ _    
/*    / __|_ __  ___  ___| |_| |_    / __|_ _ _  _ _ __| |_ ___  | |  (_) |__ 
/*    \__ \ '  \/ _ \/ _ \  _| ' \  | (__| '_| || | '_ \  _/ _ \ | |__| | '_ \
/*   |___/_|_|_\___/\___/\__|_||_|  \___|_|  \_, | .__/\__\___/ |____|_|_.__/
/*                                         |__/|_|           
/*              
/* Copyright (C) 2024 - Renaud Dubois - This file is part of SCL (Smooth CryptoLib) project
/* License: This software is licensed under MIT License                                        
/********************************************************************************************/
// SPDX-License-Identifier: MIT
pragma solidity >=0.8.19 <0.9.0;

import "forge-std/Test.sol";

import {_SECP256R1} from "@solidity/include/SCL_mask.h.sol";
import {FIELD_OID} from "@solidity/include/SCL_field.h.sol";
import "@solidity/lib/libSCL_secp256r1.sol";
import "@solidity/lib/libSCL_secp256r1_utils.sol";


contract SCL_secputils is Test {

 SCL_secp256r1_utils ecdsa_secp256r1=new SCL_secp256r1_utils();

 function test_compiling() public {

    console.log("Compiling success");
    assertEq(true,true);
 }

 /* vector from http://point-at-infinity.org/ecc/nisttv
 k = 29852220098221261079183923314599206100666902414330245206392788703677545185283
 x = 9EACE8F4B071E677C5350B02F2BB2B384AAE89D58AA72CA97A170572E0FB222F
 y = 1BBDAEC2430B09B93F7CB08678636CE12EAAFD58390699B5FD2F6E1188FC2A78
 */
 function Invariant_ecmul() public returns (bool){
   uint256 k=29852220098221261079183923314599206100666902414330245206392788703677545185283;
   uint256 x = 0x9EACE8F4B071E677C5350B02F2BB2B384AAE89D58AA72CA97A170572E0FB222F;
   uint256 y = 0x1BBDAEC2430B09B93F7CB08678636CE12EAAFD58390699B5FD2F6E1188FC2A78;
 }


 function test_isOnCurve() public
 {
   
  uint256 qx=0x5ecbe4d1a6330a44c8f7ef951d4bf165e6c6b721efada985fb41661bc6e7fd6c;
  uint256 qy=0x8734640c4998ff7e374b06ce1a64a2ecd82ab036384fb83d9a79b127a27d5032;
  uint256 q2p128_x=112495727131302244506157669471790202209849926651017016481532073180322115017576;
  uint256 q2p128_y=88228053145992414849958298035823172674083888062809552550982514976029750463913;

  assertEq(ecdsa_secp256r1.isOnCurve(qx, qy), true);
  assertEq(ecdsa_secp256r1.isOnCurve(q2p128_x, q2p128_y), true);
    
 }

 function libSCLsecp256r1() public returns (bool){
   bool res=true;
  


   return res;
 }

 function test_secp256r1() public returns (bool){
  
   console.log("libSCL_secp256r1:");
   if(FIELD_OID!=_SECP256R1){//desactivate test if configuration is not set to secp256r1
      console.log("untested");
      return true;
   }
   bool res= libSCLsecp256r1();
   assertEq(res,true);
 }

}