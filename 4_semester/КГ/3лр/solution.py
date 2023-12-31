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
    gluPerspective(45, (display[0]/display[1]), 0.1, 50.0)
    glTranslatef(0.0, 0.0, -5)

    # point light from the left, top, front
    glLight(GL_LIGHT0, GL_POSITION,  (5, 5, 5, 1))
    glLightfv(GL_LIGHT0, GL_AMBIENT, (0, 0, 0, 1))
    glLightfv(GL_LIGHT0, GL_DIFFUSE, (1, 1, 1, 1))

    glEnable(GL_DEPTH_TEST)

    rotate_vector = [5, 3, 1]
    while True:
        for event in pygame.event.get():
            if event.type == pygame.QUIT:
                pygame.quit()
                quit()
        # input events to rotate vector
        pressed = pygame.key.get_pressed()
        if pressed[pygame.K_UP]:
            rotate_vector = [1, 0, 0]
        if pressed[pygame.K_DOWN]:
            rotate_vector = [5, 3, 1]
        if pressed[pygame.K_RIGHT]:
            rotate_vector = [0, 0, 1]
        if pressed[pygame.K_LEFT]:
            rotate_vector = [0, 1, 0]
        if pressed[pygame.K_SPACE]:
            rotate_vector = [0, 0, 0]

        glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT)

        glEnable(GL_LIGHTING)
        glEnable(GL_LIGHT0)
        glColorMaterial(GL_FRONT_AND_BACK, GL_AMBIENT_AND_DIFFUSE)

        if rotate_vector != [0, 0, 0]:
            glRotatef(1, rotate_vector[0], rotate_vector[1], rotate_vector[2])

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

        glDisable(GL_LIGHT0)
        glDisable(GL_LIGHTING)

        pygame.display.flip()
        pygame.time.wait(10)


main()
