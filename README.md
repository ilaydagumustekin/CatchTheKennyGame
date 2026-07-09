# Catch The Kenny Game

A simple and interactive iOS game built with **SwiftUI** where players try to catch Kenny as many times as possible before the timer runs out.

## Overview

Catch The Kenny Game is a fast-paced tap game developed to practice SwiftUI state management, timers, gestures, and persistent data handling.  
Kenny appears randomly on the screen, and each successful tap increases the score. When the countdown reaches zero, the game ends and the player can choose to play again.

## Features

- Random Kenny movement
- 30-second countdown timer
- Tap-to-score gameplay
- Game over alert
- Restart option
- Persistent high score with `@AppStorage`
- Clean SwiftUI layout

## Technologies

- Swift
- SwiftUI
- Combine
- Timer Publisher
- `@State`
- `@AppStorage`
- `onTapGesture`

## How It Works

1. Kenny appears in a random position.
2. Tap Kenny before he changes position.
3. Each correct tap increases the score by 1.
4. The timer counts down from 30 seconds.
5. When time is up, the game ends and the highest score is preserved.

## Learning Goals

This project was built to improve:

- SwiftUI view composition
- State-driven UI updates
- Timer usage in SwiftUI
- Randomized game logic
- Persistent score tracking
- Basic mobile game structure

## Screenshots

<p align="center">
  <img src="assets/kenny-game-preview.png" width="280" />
</p>

## Installation

```bash
git clone https://github.com/ilaydagumustekin/CatchTheKennyGame.git
