<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Añadir Coche</title>
    <script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="css/style.css">
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

    if (isset($_POST["submit"]) && $_SERVER["REQUEST_METHOD"] == "POST") {
        $marca = filtrado($_POST["marca"]);
        $modelos = filtrado($_POST["modelos"]);
        $kms = filtrado($_POST["kms"]);
        $matricula = filtrado($_POST["matricula"]);
        $año = filtrado($_POST["año"]);
        $subasta = filtrado($_POST["subasta"]);
        $costo = filtrado($_POST["total"]);
        $tasador = filtrado($_POST["tasador"]);
        $compraventa = filtrado($_POST["compraventa"]);
        $peritacion = $_POST["peritacion"];
    }


    if (isset($_POST["submit"])) {
        

        if ($marca == '' or $modelos == 0 or $matricula == '' or $año == '' or $costo == '' or $compraventa == '' or $subasta == '' or $tasador == '' or $kms == '' or $peritacion == '') {
            $error = "Rellena todos los campos";
        } else {

            $consulta = "SELECT marca FROM marcas WHERE id=$marca";
            $resultado = mysqli_query($conn, $consulta);

            $row = mysqli_fetch_row($resultado);

            $sacarModelo = "SELECT modelo FROM modelos WHERE id=$modelos";
            $resultadoM = mysqli_query($conn, $sacarModelo);

            $row2 = mysqli_fetch_row($resultadoM);

            $costoTotal = $subasta + $costo;
            $diferencia = $tasador - $costoTotal;
            $beneficio = $compraventa - $costoTotal;
            

            $coche = "INSERT INTO coches(marca, modelo, kms, matricula, año, subasta, costo, tasador, diferencia, compraventa, beneficio, peritacion) VALUES ('$row[0]', '$row2[0]', $kms, '$matricula', $año, $subasta, $costoTotal, $tasador, $diferencia, $compraventa, $beneficio, '$peritacion')";
            mysqli_query($conn, $coche);

            header('Location: coches.php');
        }
    }

    if (isset($_POST["back"])) {
        header('Location: coches.php');
    }

    ?>

    <header>
        <h1>Añadir Coche</h1>
    </header>

    <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post" class="añadir">

        <label for="">Marca</label>
        <select name="marca" id="marca" class="form-select form-select-sm">
            <?php
            $marca = 'SELECT id, marca FROM marcas ORDER BY marca ASC';
            $resultado = mysqli_query($conn, $marca);

            while ($row = mysqli_fetch_row($resultado)) {
                $cadena = $cadena . '<option value=' . $row[0] . '>' . $row[1] . '</option>';
            }

            echo $cadena;

            ?>
        </select><br>

        <label for="">Modelo</label>
        <select name="modelos" id="modelos" class="form-select form-select-sm"></select><br>

        <label for="">Año</label>
        <select name="año" class="form-select form-select-sm">
            <option selected="true">Selecciona el año</option>
            <?php
            for ($i = 2010; $i < 2022; $i++) {
                echo "<option value=$i>$i</option>";
            }
            ?>

        </select><br>

        <label for="">Kilometros</label><br>
        <input type="text" name="kms" class="form-control" placeholder="Kms"><br>

        <label for="">Matricula</label><br>
        <input type="text" name="matricula" placeholder="Matricula"><br>

        <label for="">Precio Subasta</label><br>
        <input type="text" name="subasta" placeholder="Precio"><br>

        <label for="">Gastos</label><br>
        <input type="text" name="total" placeholder="Gastos"><br>

        <label for="">SuperTasador</label><br>
        <input type="text" name="tasador" placeholder="Precio"><br>

        <label for="">Compraventa</label><br>
        <input type="text" name="compraventa" placeholder="Precio"><br>

        <label for="">Enlace Peritacion</label><br>
        <input type="text" name="peritacion" placeholder="Enlace Peritación"><br>

        <p class="error"><?= $error ?></p>

        <div class="btnAñadir">
            <input type="submit" name="submit" value="Añadir Coche" class="btn btn-success">
        </div>

        <div class="btnAñadir">
            <input type="submit" name="back" value="Atras" class="btn btn-primary">
        </div>

    </form>

    <script type="text/javascript">
        $(document).ready(function() {
            $('#marca').val(1);
            recargarLista();

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