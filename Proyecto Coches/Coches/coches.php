<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Listado</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="css/style.css">
    <script src="https://kit.fontawesome.com/956abbe386.js" crossorigin="anonymous"></script>
</head>

<body>
    <div id="container">
        <?php

        $servername = "localhost";
        $database = "coches";
        $username = "root";
        $password = "";
        $mensaje = "";

        $conn = mysqli_connect($servername, $username, $password, $database);

        function filtrado($datos)
        {
            $datos = trim($datos); // Elimina espacios antes y después de los datos
            $datos = stripslashes($datos); // Elimina backslashes \
            $datos = htmlspecialchars($datos); // Traduce caracteres especiales en entidades HTML
            return $datos;
        }

        if (isset($_POST["eliminar"])) {
            $eliminar = filtrado($_POST["eliminar"]);

            $borrarCoche = "UPDATE coches SET activo=0 WHERE id=$eliminar";
            mysqli_query($conn, $borrarCoche);
        }

        if (isset($_POST["añadir"])) {

            header('Location: añadir.php');
        }

        if (isset($_POST["peritacion"])) {

            $matricula = filtrado($_POST["peritacion"]);

            $peritacion = "SELECT peritacion FROM coches WHERE matricula='$matricula'";
            $enlace = mysqli_query($conn, $peritacion);

            $row = mysqli_fetch_row($enlace);

            header('Location:' . $row[0]);
        }

        if (isset($_POST["modificar"])) {

            $modificar = filtrado($_POST["modificar"]);

            header('Location: editar.php?matricula=' . $modificar);
        }

        ?>

        <header>

            <h1>Listado de Coches</h1>

        </header>

        <form action="" method="post" class="coches">
            <table class="content-table" style="width:100%; text-align:center">
                <tr>
                    <th></th>
                    <th>Marca</th>
                    <th>Modelo</th>
                    <th>Kms</th>
                    <th>Matricula</th>
                    <th>Año</th>
                    <th>Precio </th>
                    <th>Costo Total</th>
                    <th>Precio </th>
                    <th>Diferencia</th>
                    <th>Precio </th>
                    <th>Beneficio</th>
                    <th></th>
                </tr>

                <?php
                $coches = "SELECT * FROM coches WHERE activo='1' ORDER BY marca ASC";
                $resultado = mysqli_query($conn, $coches);

                while ($row = mysqli_fetch_row($resultado)) {

                    if ($row[10] < 0) {
                        echo "<tr>";
                        echo "<td class='circulos'><i class='fa-solid fa-circle circuloR'></i></td>";
                        echo "<td>$row[0]</td>";
                        echo "<td>$row[1]</td>";
                        echo "<td>" . number_format($row[2], 0, ",", ".") . "</td>";
                        echo "<td>$row[3]</td>";
                        echo "<td>$row[4]</td>";
                        echo "<td>" . number_format($row[5], 0, ",", ".") . "€</td>";
                        echo "<td>" . number_format($row[6], 0, ",", ".") . "€</td>";
                        echo "<td>" . number_format($row[7], 0, ",", ".") . "€</td>";
                        echo "<td>" . number_format($row[8], 0, ",", ".") . "€</td>";
                        echo "<td>" . number_format($row[9], 0, ",", ".") . "€</td>";
                        echo "<td>" . number_format($row[10], 0, ",", ".") . "€</td>";
                        echo "<td class='botones'><button class='btn btn-info' name='peritacion' value='$row[3]'><i class='fa-solid fa-paste'></i></button>";
                        echo "<button class='btn btn-primary' name='modificar' value='$row[3]'><i class='fa-solid fa-pen-to-square'></i></button>";
                        echo "<button class='btn btn-danger' name='eliminar' value='$row[12]'><i class='fa-solid fa-trash-can'></button></i></td>";
                        echo "</tr>";
                    } else {
                        echo "<tr>";
                        echo "<td class='circulos'><i class='fa-solid fa-circle circuloG'></i></td>";
                        echo "<td>$row[0]</td>";
                        echo "<td>$row[1]</td>";
                        echo "<td>" . number_format($row[2], 0, ",", ".") . "</td>";
                        echo "<td>$row[3]</td>";
                        echo "<td>$row[4]</td>";
                        echo "<td>" . number_format($row[5], 0, ",", ".") . "€</td>";
                        echo "<td>" . number_format($row[6], 0, ",", ".") . "€</td>";
                        echo "<td>" . number_format($row[7], 0, ",", ".") . "€</td>";
                        echo "<td>" . number_format($row[8], 0, ",", ".") . "€</td>";
                        echo "<td>" . number_format($row[9], 0, ",", ".") . "€</td>";
                        echo "<td>" . number_format($row[10], 0, ",", ".") . "€</td>";
                        echo "<td class='botones'><button class='btn btn-info' name='peritacion' value='$row[3]'><i class='fa-solid fa-paste'></i></button>";
                        echo "<button class='btn btn-primary' name='modificar' value='$row[3]'><i class='fa-solid fa-pen-to-square'></i></button>";
                        echo "<button class='btn btn-danger' name='eliminar' value='$row[12]'><i class='fa-solid fa-trash-can'></button></i></td>";
                        echo "</tr>";
                    }
                }


                ?>



            </table>

            <div class="btnAñadir">
                <button class="btn btn-primary" name="añadir">Añadir Coche</button>
            </div>

        </form>
    </div>
</body>

</html>