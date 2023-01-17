<?php
$conexion = mysqli_connect('localhost', 'root', '', 'coches');
$marca = $_POST['modelos'];

$sql = "SELECT id, modelo FROM modelos WHERE id_marca='$marca' ORDER BY modelo ASC";

$matricula = $_GET['matricula'];

$result = mysqli_query($conexion, $sql);

while ($ver = mysqli_fetch_row($result)) {
    $cadena = $cadena . '<option value=' . $ver[0] . '>' . $ver[1] . '</option>';
}

echo  $cadena . "</select>";