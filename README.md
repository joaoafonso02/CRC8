# AAD - CRC-8 ENCODER/CHECKER (Cyclic Redundancy Check)

In order to develop a solution to protect the integrity of a message, a CRC with a polynomial of `b(x) = x^8 + x^7 + x^5 + x^2 + x + 1` should be implemented. Thus, for the given CRC generator, the corresponding binary pattern is `110100111`:

<!-- ```c
int b[9];
    // x^8 + x^7 + x^5 + x^2 + x + 1 
    b[8] = 1; // x^8
    b[7] = 1; // x^7
    b[6] = 0;
    b[5] = 1; // x^5
    b[4] = 0;
    b[3] = 0;
    b[2] = 1; // x^2
    b[1] = 1; // x
    b[0] = 1; // 1
``` -->

## SENDER & RECEIVER

The message and the result of the division (remainder) by the above polynomial are sent together by the `Encoder`, when sending the message, so that when it is received, the CRC `Checker` can perform the division and compare it with what was first received.
If equal, the message was not corrupted during the "journey/trip" to the receiver

## CRC8 - Encoder
![Alt text](/img/Encoder.jpeg "CRC8 - Encoder")
Fig. 1 - CRC8 ( Encoder )

The `CRC8 Encoder` circuit is designed to process a `16-bit data word (sent message)` and generate an 8-bit CRC-8 Bluetooth check string. The key component involved in this process is a `remainder calculation block`, responsible for computing the `properties of the remainder` as well as finding the `best possible algorithm` for the implementation of the encoder reducing the number of xors, resulting in an `8-bit output, the remainder/CRC8`. 

In order to develop the remainder calculation block and discern the optimal algorithm, an auxiliary `table` was created. Properties of the remainder and the table, depicted in the images below, play a crucial role in determining the `most effective algorithm` for achieving the desired results previously mentioned (`Parallel Implementation`). Note that in the second figure there is a mistake inside the mod function, the polynomial is the same as previously mentioned, as it is possible to observe in each line of coefficient and compare it with the functions of the first figure.

|                |              |
| ---------------------- | ---------------------- |
| ![p](/img/propertiesRemainder.png) | ![p2](/img/polynomialFunctions.png) |

Fig. 2 - Functions for the Properties of the Remainder

The following tables were accomplished by forming bit permutations/combinations for each level (Note: only level 0 and 1 tables are being displayed below, 0-4 levels were created)

![Alt text](/img/table.png "CRC8 - Table")
Fig. 3 - Table from Level 0 combining the bits 

![Alt text](/img/table2.png "CRC8 - Table")
Fig. 4 - Table from Level 1 combining the bits 

After creating these tables and discerned the best algorithm, it was possible to reduce the `58 XORS` (No optimization) to the final `41 XORS` as it is possible to check in the Fig. 1.

## CRC8 - Checker
![Alt text](/img/Checker.jpeg "CRC8 - Checker")
Fig. 5 - CRC8 ( Checker )

The `CRC8 checker` circuit serves a crucial role in `validating the integrity` of received data in the context of a CRC-8 Bluetooth implementation. Its primary purpose is to verify whether the received 24-bit data word has been transmitted without errors by comparing it against the associated 8-bit CRC check string. This checker is an essential component in `error-detection` systems, ensuring the reliability and accuracy of the transmitted information. 

(Bit serial implementation)

### Tests
To validate the accuracy of the CRC8 Encoder implementation, four tests were devised, as depicted in the images below. The outcomes of these tests were then compared with the results obtained through manual binary division on paper. Note: `First 23 bits` correspond to the sent `message` and the `last 8 bits` to the `remainder/CRC`. 

**WaveForm 1**

![Alt text](/img/testWaveForm1.jpeg "CRC8 - Encoder Test")

**WaveForm 2**

![Alt text](/img/testWaveForm2.jpeg "CRC8 - Encoder Test")

**WaveForm 3**

![Alt text](/img/testWaveForm3.jpeg "CRC8 - Encoder Test")

**WaveForm 4**

![Alt text](/img/testWaveForm4.jpeg "CRC8 - Encoder Test")

