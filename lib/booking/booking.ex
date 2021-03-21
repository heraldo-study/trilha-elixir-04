defmodule Flightex.Booking.Booking do
  @keys [:id, :data_completa, :cidade_origem, :cidade_destino, :id_usuario]
  @enforce_keys @keys

  defstruct @keys

  def build(cidade_origem, cidade_destino, %NaiveDateTime{} = data_completa, id_usuario) do
    {:ok,
     %__MODULE__{
       id: UUID.uuid4(),
       data_completa: data_completa,
       cidade_origem: cidade_origem,
       cidade_destino: cidade_destino,
       id_usuario: id_usuario
     }}
  end

  def build(_cidade_origem, _cidade_destino, _data_completa, _id_usuario) do
    {:error, "Invalid Date"}
  end
end
