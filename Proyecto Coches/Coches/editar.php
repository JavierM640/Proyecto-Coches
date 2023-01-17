<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Editar Coche</title>
    <link rel="stylesheet" href="css/style.css">
    <script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</head>

<body>
    <?php

    $servername = "localhost";
    $database = "coches";
    $username = "root";
    $password = "";
    $mensaje = "";

    $conn = mysqli_connect($servername, $username, $password, $database);

    $error = '';

    function filtrado($datos)
    {
        $datos = trim($datos); // Elimina espacios antes y después de los datos
        $datos = stripslashes($datos); // Elimina backslashes \
        $datos = htmlspecialchars($datos); // Traduce caracteres especiales en entidades HTML
        return $datos;
    }

    if (isset($_POST["editar"]) && $_SERVER["REQUEST_METHOD"] == "POST") {
        $marca = filtrado($_POST["marca"]);
        $modelos = filtrado($_POST["modelos"]);
        $kms = filtrado($_POST["kms"]);
        $matricula2 = filtrado($_POST["matricula"]);
        $año = filtrado($_POST["año"]);
        $subasta = filtrado($_POST["subasta"]);
        $costo = filtrado($_POST["total"]);
        $tasador = filtrado($_POST["tasador"]);
        $compraventa = filtrado($_POST["compraventa"]);
        $peritacion = $_POST["peritacion"];
        $id = $_POST["id"];
    }

    $matricula = $_GET['matricula'];

    if (isset($_POST["editar"])) {

        $costoTotal = $subasta + $costo;
        $diferencia = $tasador - $costoTotal;
        $beneficio = $compraventa - $costoTotal;

        $cogerModelo = "SELECT modelo FROM modelos WHERE id='$modelos'";
        $resultado = mysqli_query($conn, $cogerModelo);
        $row = mysqli_fetch_row($resultado);

        $cogerMarca = "SELECT marca FROM marcas WHERE id='$marca'";
        $resultado2 = mysqli_query($conn, $cogerMarca);
        $row2 = mysqli_fetch_row($resultado2);

        $editar = "UPDATE coches SET marca='$row2[0]', modelo='$row[0]', kms='$kms', matricula='$matricula2', año='$año', subasta='$subasta', costo='$costoTotal', tasador='$tasador', diferencia='$diferencia', compraventa='$compraventa', beneficio='$beneficio', peritacion='$peritacion' WHERE id='$id'";
        mysqli_query($conn, $editar);

        header('Location: coches.php');
    }

    if (isset($_POST["back"])) {
        header('Location: coches.php');
    }

    ?>

    <header>
        <h1>Editar Coche</h1>
    </header>

    <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post" class="añadir">

        <?php

        $datosCoche = "SELECT * FROM coches WHERE matricula='$matricula'";
        $resultado = mysqli_query($conn, $datosCoche);

        $marca = 'SELECT id, marca FROM marcas ORDER BY marca ASC';
        $resultado2 = mysqli_query($conn, $marca);

        $row = mysqli_fetch_row($resultado);

        $datosCoche2 = "SELECT id FROM marcas WHERE marca='$row[0]'";
        $resultado10 = mysqli_query($conn, $datosCoche2);

        $idMarca = mysqli_fetch_row($resultado10);

        $modeloCoche = $row['1'];

        $modelo = "SELECT id_marca FROM modelos WHERE modelo= '$modeloCoche'";
        $resultado3 = mysqli_query($conn, $modelo);

        $row3 = mysqli_fetch_array($resultado3);

        $idCoche = $row3['id_marca'];

        $datosCoche3 = "SELECT id FROM modelos WHERE modelo='$row[1]' AND id_marca='$idCoche'";
        $resultado11 = mysqli_query($conn, $datosCoche3);

        $idModelo = mysqli_fetch_row($resultado11);

        $modelosCoche = "SELECT id, modelo FROM modelos WHERE id_marca='$idCoche' ORDER BY modelo ASC";
        $resultado4 = mysqli_query($conn, $modelosCoche);

        echo "<label for=''>Marca</label><br>";
        echo "<select name='marca' id='marca' class='form-select form-select-sm'><br>";
        echo "<option value='$idMarca[0]'>$row[0]</option>";

        while ($row2 = mysqli_fetch_row($resultado2)) {
            echo "<option value='$row2[0]'>$row2[1]</option>";
        }

        echo "</select><br>";

        echo "<label for=''>Modelo</label>";
        echo "<select name='modelos' id='modelos' class='form-select form-select-sm'>";
        echo "<option value='$idModelo[0]'>$row[1]</option>";

        while ($row4 = mysqli_fetch_row($resultado4)) {
            echo "<option value='$row4[0]'>$row4[1]</option>";
        }

        echo "</select><br>";

        echo "<label for=''>Año</label>";
        echo "<select name='año' class='form-select form-select-sm'>";
        echo "<option value='$row[4]'>$row[4]</option>";

        for ($i = 2010; $i < 2022; $i++) {
            echo "<option value=$i>$i</option>";
        }

        echo "</select><br>";

        echo "<label for=''>Kilometros</label><br>";
        echo "<input type='text' name='kms' class='form-control' value='$row[2]'><br>";

        echo "<label for=''>Matricula</label><br>";
        echo "<input type='text' name='matricula' placeholder='Matricula' value='$row[3]'><br>";

        echo "<label for=''>Precio Subasta</label><br>";
        echo "<input type='text' name='subasta' placeholder='Precio' value='$row[5]'><br>";

        $gastos = $row[6] - $row[5];

        echo "<label for=''>Gastos</label><br>";
        echo "<input type='text' name='total' placeholder='Gastos' value='$gastos'><br>";

        echo "<label for=''>SuperTasador</label><br>";
        echo "<input type='text' name='tasador' placeholder='Precio' value='$row[7]'><br>";

        echo "<label for=''>Compraventa</label><br>";
        echo "<input type='text' name='compraventa' placeholder='Precio' value='$row[9]'><br>";

        echo "<label for=''>Enlace Peritacion</label><br>";
        echo "<input type='text' name='peritacion' placeholder='Enlace Peritación' value='$row[11]'><br>";

        echo "<input type='text' name='id' value='$row[12]' hidden>";


        ?>

        <p class="error"><?= $error ?></p>

        <div class="btnAñadir">
            <input type="submit" name="editar" value="Editar Coche" class="btn btn-success">
        </div>

        <div class="btnAñadir">
            <input type="submit" name="back" value="Atras" class="btn btn-primary">
        </div>

    </form>
    <script type="text/javascript">
        $(document).ready(function() {

            $('#marca').change(function() {
                recargarLista();
            });
        })
    </script>
    <script type="text/javascript">
        function recargarLista() {
            $.ajax({
                type: "POST",
                url: "modelos.php",
                data: "modelos=" + $('#marca').val(),
                success: function(r) {
                    $('#modelos').html(r);
                }
            });
        }
    </script>


</body>

</html>