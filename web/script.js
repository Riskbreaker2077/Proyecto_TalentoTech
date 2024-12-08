const labels = ['Eólica', 'Biomasa', 'Solar', 'Hidroeléctrica'];
let productionData = [0, 0, 0, 0]; // Datos de producción en GWh
let consumptionData = [0, 0, 0, 0]; // Datos de consumo en GWh

// Configuración del gráfico
const ctx = document.getElementById('energyChart').getContext('2d');
const energyChart = new Chart(ctx, {
    type: 'bar', // Tipo de gráfico
    data: {
        labels: labels, // Etiquetas de las categorías
        datasets: [{
            label: 'Producción (GWh)',
            data: productionData,
            backgroundColor: '#4BC0C0', // Color de las barras de producción
            borderColor: '#4BC0C0',
            borderWidth: 1
        },
        {
            label: 'Consumo (GWh)',
            data: consumptionData,
            backgroundColor: '#FF6384', // Color de las barras de consumo
            borderColor: '#FF6384',
            borderWidth: 1
        }]
    },
    options: {
        responsive: true,
        scales: {
            y: {
                beginAtZero: true,
                ticks: {
                    stepSize: 500, // Establece la cantidad de pasos en el eje Y
                    max: 3500
                }
            }
        }
    }
});

// Función para actualizar los datos del gráfico
function updateChart() {
    // Obtener los valores ingresados por el usuario
    const eolicaProd = parseFloat(document.getElementById('eolicaProd').value) || 0;
    const eolicaCons = parseFloat(document.getElementById('eolicaCons').value) || 0;
    const biomasaProd = parseFloat(document.getElementById('biomasaProd').value) || 0;
    const biomasaCons = parseFloat(document.getElementById('biomasaCons').value) || 0;
    const solarProd = parseFloat(document.getElementById('solarProd').value) || 0;
    const solarCons = parseFloat(document.getElementById('solarCons').value) || 0;
    const hidroProd = parseFloat(document.getElementById('hidroProd').value) || 0;
    const hidroCons = parseFloat(document.getElementById('hidroCons').value) || 0;

    // Actualizar los datos del gráfico
    productionData = [eolicaProd, biomasaProd, solarProd, hidroProd];
    consumptionData = [eolicaCons, biomasaCons, solarCons, hidroCons];

    // Actualizar el gráfico con los nuevos datos
    energyChart.data.datasets[0].data = productionData;
    energyChart.data.datasets[1].data = consumptionData;
    energyChart.update();
}

// Añadir evento de entrada para actualizar el gráfico en tiempo real
document.querySelectorAll('.form-control').forEach(input => {
    input.addEventListener('input', updateChart);
});



