#!/usr/bin/env python

from enum import Enum


class PacketDirection(Enum):
    """ Packet Direction creates constants for the direction of the packets.

    There are two given directions that the packets can Feature along
    the line. PacketDirection is an enumeration with the values
    forward (1) and reverse (2).
    """

    FORWARD = 1
    REVERSE = 2
