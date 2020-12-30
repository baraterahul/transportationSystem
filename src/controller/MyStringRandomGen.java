/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package controller;

/**
 *
 * @author Swapnil
 */
import java.util.Random;
 
public class MyStringRandomGen {
 
    private static final String Char ="1234567890";
    private static final int RANDOM_STRING_LENGTH = 04;
     
    /**
     * This method generates random string
     * @return
     */
    public  String generateRandomString(){
         
        StringBuffer randStr = new StringBuffer();
        for(int i=0; i<RANDOM_STRING_LENGTH; i++){
            int number = getRandomNumber();
            char ch = Char.charAt(number);
            randStr.append(ch);
        }
        return randStr.toString();
    }
     
    /**
     * This method generates random numbers
     * @return int
     */
    private int getRandomNumber() {
        int randomInt = 0;
        Random randomGenerator = new Random();
        randomInt = randomGenerator.nextInt(Char.length());
        if (randomInt - 1 == -1) {
            return randomInt;
        } else {
            return randomInt - 1;
        }
    }
     
    public static void main(String a[]){
        MyStringRandomGen msr = new MyStringRandomGen();
        System.out.println(msr.generateRandomString());
 
    }
}