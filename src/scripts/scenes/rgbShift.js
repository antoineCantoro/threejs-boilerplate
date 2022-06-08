import * as THREE from 'three'
import { OrbitControls } from 'three/examples/jsm/controls/OrbitControls.js'
import * as dat from 'lil-gui'

import vertexShader from '../../shaders/rgbshift/vertex.glsl'
import fragmentShader from '../../shaders/rgbshift/fragment.glsl'

// Base Demo
// https://www.youtube.com/watch?v=DH1KqXQvICQ&ab_channel=YuriArtiukh

export default () => {
    /**
     * Base
     */
    // Debug
    const gui = new dat.GUI()

    const settings = {
        progress: 0
    }

    // gui.add(settings, "progress", 0, 1, 0.01).onChange(() => {
    //     planeMaterial.uniforms["uProgress"].value = settings['uProgress'];
    // });



    // Canvas
    const canvas = document.querySelector('canvas.webgl')

    // Scene
    const scene = new THREE.Scene()

    /**
     * Textures
     */
    const textureLoader = new THREE.TextureLoader()
    const imageTexture = textureLoader.load('textures/texture01.jpeg')
    const displacementTexture01 = textureLoader.load('textures/displacement01.jpg')
    const displacementTexture02 = textureLoader.load('textures/displacement02.jpeg')


    const planeGeometry = new THREE.PlaneBufferGeometry(1, 1, 32, 32)

    const planeMaterial = new THREE.ShaderMaterial({
        vertexShader: vertexShader,
        fragmentShader: fragmentShader,
        side: THREE.DoubleSide,
        uniforms: {
            uDisplacement: { value: displacementTexture01 },
            uImage: { value: imageTexture },
            uFrequency: { value: new THREE.Vector2(10, 5) },
            uProgress: { value: settings.progress },
            uTime: { value: 0 },
            uColor: { value: new THREE.Color('orange') },
            // uTexture: { value: flagTexture }
        }
    })

    const planeMesh = new THREE.Mesh(planeGeometry, planeMaterial)


    scene.add(planeMesh)

    gui.add(planeMaterial.uniforms.uProgress, "value", 0, 1, 0.01)

    /**
     * 
     * 
     * Sizes
     */
    const sizes = {
        width: window.innerWidth,
        height: window.innerHeight
    }

    window.addEventListener('resize', () =>
    {
        // Update sizes
        sizes.width = window.innerWidth
        sizes.height = window.innerHeight

        // Update camera
        camera.aspect = sizes.width / sizes.height
        camera.updateProjectionMatrix()

        // Update renderer
        renderer.setSize(sizes.width, sizes.height)
        renderer.setPixelRatio(Math.min(window.devicePixelRatio, 2))
    })

    /**
     * Camera
     */
    // Base camera
    const camera = new THREE.PerspectiveCamera(75, sizes.width / sizes.height, 0.1, 100)
    camera.position.x = 0
    camera.position.y = 0
    camera.position.z = 1.5
    scene.add(camera)

    // Controls
    const controls = new OrbitControls(camera, canvas)
    controls.enableDamping = true

    /**
     * Renderer
     */
    const renderer = new THREE.WebGLRenderer({
        canvas: canvas
    })
    renderer.setSize(sizes.width, sizes.height)
    renderer.setPixelRatio(Math.min(window.devicePixelRatio, 2))

    /**
     * Animate
     */
    const clock = new THREE.Clock()

    const tick = () =>
    {
        const elapsedTime = clock.getElapsedTime()

        // Update controls
        controls.update()

        planeMaterial.uniforms.uTime.value = elapsedTime

        // Render
        renderer.render(scene, camera)

        // Call tick again on the next frame
        window.requestAnimationFrame(tick)
    }

    tick()
}