from cProfile import run
from time import sleep
import pygame as pygames


game = True


while game:
    pygames.init()
    win = pygames.display.set_mode((1280, 720))
    pygames.display.set_caption("My Game")
    x = 100
    y = 100
    baddyX = 300
    baddyY = 300
    vel = 0.4
    baddyVel = 0.2
    run = True
    def draw_game():
        win.fill((0, 0, 0))
        pygames.draw.rect(win, (0, 0, 255), (x, y, 20, 20))
        pygames.draw.rect(win, (255, 0, 0), (baddyX, baddyY, 40, 40))
        pygames.display.update()

    def drawText(text, font, surface, x, y):
            textobj = font.render(text, 1, (255, 255, 255))
            textrect = textobj.get_rect()
            textrect.topleft = (x, y)
            surface.blit(textobj, textrect)


    while run:
        pygames.time.delay(1)

        if baddyX < x -20:
            baddyX += baddyVel 
            draw_game() 
        elif baddyX > x + 20:
            draw_game()
            baddyX -= baddyVel 
        elif baddyY < y - 20:
            baddyY += baddyVel 
            draw_game()
        elif baddyY > y + 20:
            baddyY -= baddyVel 
        else:
            run = False

        for event in pygames.event.get():
            if event.type == pygames.QUIT:
                run = False

        keys = pygames.key.get_pressed()

        if keys[pygames.K_LEFT]:
            x -= vel

        if keys[pygames.K_RIGHT]:
            x += vel

        if keys[pygames.K_UP]:
            y -= vel

        if keys[pygames.K_DOWN]:
            y += vel

        draw_game()
        
        if keys[pygames.K_ESCAPE]:
            game = False
            run = False


    baddyX = 9999
    baddyY = 9999
    x = 9999
    y = 9999
    draw_game()

    drawText("Game Over", pygames.font.SysFont("arial", 72), win, 455, 280)

    pygames.display.update()

    sleep(5)

    if keys[pygames.K_ESCAPE]:
        game = False
    
    pygames.quit()
