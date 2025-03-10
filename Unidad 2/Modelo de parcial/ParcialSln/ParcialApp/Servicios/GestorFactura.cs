﻿using ParcialApp.Acceso_a_datos;
using ParcialApp.Dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ParcialApp.Servicios
{
	class GestorFactura
	{
		private IFacturaDao dao;
		public GestorFactura(AbstractDaoFactory factory)
		{
			dao = factory.CrearFacturaDao();
		}
		public List<Producto> ObtenerProductos()
		{
			return dao.GetProductos();
		}

		public int ProximaFactura()
		{
			return dao.ObtenerProximoNumero();
		}

		internal bool NuevaFactura(Factura oFactura)
		{
			return dao.InsertarFactura(oFactura);
		}
	}
}
