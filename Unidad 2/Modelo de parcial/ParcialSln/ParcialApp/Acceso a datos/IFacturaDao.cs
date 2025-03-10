﻿using ParcialApp.Dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ParcialApp.Acceso_a_datos
{
    interface IFacturaDao
    {

        List<Producto> GetProductos();
        bool Save(Factura oFactura);
		int ObtenerProximoNumero();
		bool InsertarFactura(Factura oFactura);
	}
}
