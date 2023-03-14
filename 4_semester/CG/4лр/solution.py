import pygame
from pygame.locals import *
from OpenGL.GL import *
from OpenGL.GLU import *


def drawTruncatedPyramid(height=1, width=1, length=1, aspect_ratio=1):
    verticies = (
        (1 * aspect_ratio, -1, -1 * aspect_ratio), 
        (1,  1, -1), 
        (-1,  1, -1),  
        (-1 * aspect_ratio, -1, -1 * aspect_ratio), 
        (1 * aspect_ratio, -1,  1 * aspect_ratio),  
        (1,  1,  1),  
        (-1 * aspect_ratio, -1,  1 * aspect_ratio), 
        (-1,  1,  1), 
    )

    verticies = tuple((x * width, y * height, z * length)
                      for x, y, z in verticies)

    # normals and edge tuple
    surfaces = (
        ((0,  0, -1), (0, 1, 2, 3)),
        ((-1,  0,  0), (3, 2, 7, 6)),
        ((0,  0,  1), (6, 7, 5, 4)),
        ((1,  0,  0), (4, 5, 1, 0)),
        ((0,  1,  0), (1, 5, 7, 2)),
        ((0, -1,  0), (4, 0, 3, 6))
    )

    glBegin(GL_QUADS)
    for normal, edge in surfaces:
        glNormal3fv(normal)
        for vertex in edge:
            glVertex3fv(verticies[vertex])
    glEnd()


def main():
    pygame.init()
    display = (1000, 800)
    pygame.display.set_mode(display, DOUBLEBUF | OPENGL)
    pygame.display.set_caption("Doshirak")
    
    glEnable(GL_DEPTH_TEST)
    glMatrixMode(GL_PROJECTION)
    glLoadIdentity()
    glOrtho(0, 6, 4, 0, 0.1, 50) 
    glTranslatef(3, 2, -5)
    glMatrixMode(GL_MODELVIEW)
    glLoadIdentity()
    # Make the model more logical.
    glRotatef(180,0,0,1)
    glPushMatrix()

    # point light from the left, top, front
    glLight(GL_LIGHT0, GL_POSITION,  (5, 5, 5, 1))
    glLightfv(GL_LIGHT0, GL_AMBIENT, (0, 0, 0, 1))
    glLightfv(GL_LIGHT0, GL_DIFFUSE, (1, 1, 1, 1))

    now_rotate = 0
    enable_light = False
    while True:
        for event in pygame.event.get():
            if event.type == pygame.QUIT:
                pygame.quit()
                quit()
            if event.type == pygame.KEYDOWN and event.key == pygame.K_SPACE:
                enable_light = not enable_light
                if enable_light:
                    glEnable(GL_LIGHTING)
                    glEnable(GL_LIGHT0)
                else:
                    glDisable(GL_LIGHTING)
                
        # input events to rotate vector
        pressed = pygame.key.get_pressed()
        if pressed[pygame.K_UP]:
            pygame.display.set_caption("Y-axis")
            glPopMatrix()
            glPushMatrix()
            glRotatef(90,1,0,0)
        if pressed[pygame.K_DOWN]:
            pygame.display.set_caption("Rotate object")
            now_rotate += 4
            glPopMatrix()
            glPushMatrix()
            glRotatef(now_rotate,1,1,1)
        if pressed[pygame.K_RIGHT]:
            pygame.display.set_caption("X-axis")
            glPopMatrix()
            glPushMatrix()
        if pressed[pygame.K_LEFT]:
            pygame.display.set_caption("Z-axis")
            glPopMatrix()
            glPushMatrix()
            glRotatef(90,0,1,0)
    
        glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT)
        glColorMaterial(GL_FRONT_AND_BACK, GL_AMBIENT_AND_DIFFUSE)

        # Draw box
        drawTruncatedPyramid(height=0.3, width=0.8, aspect_ratio=0.75)

        # Draw the top border box
        # Draw side borders
        glPushMatrix()
        glTranslatef(0.8, 0.3, 0)
        drawTruncatedPyramid(height=0.1, width=0.1, length=1.1)
        glTranslatef(-1.6, 0, 0)
        drawTruncatedPyramid(height=0.1, width=0.1, length=1.1)
        glPopMatrix()
        # Draw front borders
        glPushMatrix()
        glTranslatef(0, 0.3, 1)
        drawTruncatedPyramid(height=0.1, width=0.899, length=0.099)
        glTranslatef(0, 0, -2)
        drawTruncatedPyramid(height=0.1, width=0.899, length=0.099)
        glPopMatrix()

        # Draw the box lid
        glPushMatrix()
        glTranslatef(0, 0.3, 0)
        drawTruncatedPyramid(height=0.007, width=0.5,
                         length=0.7, aspect_ratio=1.25)
        glPopMatrix()

        # Draw the legs of box
        glPushMatrix()
        glTranslatef(0.4, -0.3, 0)
        drawTruncatedPyramid(height=0.02, width=0.1, length=0.6, aspect_ratio=0.9)
        glTranslatef(-0.8, 0, 0)
        drawTruncatedPyramid(height=0.02, width=0.1, length=0.6, aspect_ratio=0.9)
        glPopMatrix()

        pygame.display.flip()
        pygame.time.wait(10)


main()
