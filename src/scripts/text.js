import { FontLoader } from 'three/examples/jsm/loaders/FontLoader.js'
import { TextGeometry } from 'three/examples/jsm/geometries/TextGeometry.js'


/**
 * Fonts
 */
 const fontLoader = new FontLoader()

 fontLoader.load(
     '/fonts/helvetiker_regular.typeface.json',
     (font) =>
     {
         // Material
         const material = new THREE.MeshMatcapMaterial({ matcap: matcapTexture })
 
         // Text
         const textGeometry = new TextGeometry(
             'Hello Three.js',
             {
                 font: font,
                 size: 0.5,
                 height: 0.2,
                 curveSegments: 12,
                 bevelEnabled: true,
                 bevelThickness: 0.03,
                 bevelSize: 0.02,
                 bevelOffset: 0,
                 bevelSegments: 5
             }
         )
         textGeometry.center()
 
         const text = new THREE.Mesh(textGeometry, material)
         scene.add(text)
 
         // Donuts
         const donutGeometry = new THREE.TorusGeometry(0.3, 0.2, 32, 64)
 
         for(let i = 0; i < 100; i++)
         {
             const donut = new THREE.Mesh(donutGeometry, material)
             donut.position.x = (Math.random() - 0.5) * 10
             donut.position.y = (Math.random() - 0.5) * 10
             donut.position.z = (Math.random() - 0.5) * 10
             donut.rotation.x = Math.random() * Math.PI
             donut.rotation.y = Math.random() * Math.PI
             const scale = Math.random()
             donut.scale.set(scale, scale, scale)
 
             scene.add(donut)
         }
     }
 )