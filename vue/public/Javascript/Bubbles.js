//Variables
let c = document.querySelector("#canvas-custom");
let ctx = c.getContext("2d");
updateCanvas();

let mousePosition = {"x":0,"y":0};
let DRAW_INTERVAL = 10;

let particles = [];
for (let i = 0; i < 300; i++) {
    particles.push(Particle());
}

//Set up functions
setInterval(drawFrame, DRAW_INTERVAL);
document.addEventListener("mousemove", e => updateMouse(e));

//Functions
function drawFrame(){
    //update width and height of canvas
    updateCanvas();
        
    //update and draw particles
    particles.forEach(p => {
        updateParticle(p);
        drawParticle(p);
    });

}

function updateCanvas(){
    c.width = window.innerWidth;
    c.height = window.innerHeight;
}

function updateMouse(e){
    mousePosition.x = e.offsetX;
    mousePosition.y = e.offsetY;
}

function drawParticle(p){
    if(p.size > 0){
        ctx.beginPath();
        ctx.fillStyle = "#f0f0f0";
        ctx.ellipse(p.position.x, p.position.y, 
                    p.size, p.size,
                    0, 0, 2*Math.PI);
        ctx.fill();
    }
}

//Particle methods
function Particle(){
    return {size:Math.random() * 7.5, 
            position:{x:Math.random() * c.width, y:Math.random() * c.height},
            speed:(Math.random() + 0.5) / 2
        };
}

function updateParticle(p){
    //add the falling motion
    p.position.y -= p.speed;

    //move away from mouse if nearby
    let deltaSqr = Math.pow(p.position.x - mousePosition.x, 2) + 
                   Math.pow(p.position.y - mousePosition.y, 2);
    
    let mouseRadius = Math.pow(50, 2);

    if(deltaSqr < mouseRadius){
        if(p.position.x <= mousePosition.x){
            p.position.x -= 0.25;
        } else{
            p.position.x += 0.25;
        }
    }

    if(deltaSqr < mouseRadius / 2){
        if(p.position.x <= mousePosition.x){
            p.position.x -= 0.5;
        } else{
            p.position.x += 0.5;
        }
    }

    if(deltaSqr < mouseRadius / 4){
        if(p.position.x <= mousePosition.x){
            p.position.x -= 0.75;
        } else{
            p.position.x += 0.75;
        }
    }

    //check p height, move to top if out of frame.
    if(p.position.y < -10){
        resetParticle(p);
    }
}

function resetParticle(p){
    p.position.x = Math.random() * c.width
    p.position.y = c.height;
}