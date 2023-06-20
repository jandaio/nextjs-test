Marlew web
React with redux, SSR.

problematica API-FETCH-STATE

Implementamos muchas cosas en las cual resolvimos o adaptamos conceptos ya que en ese momento el estado de arte no estaba totalmente claro o desarrollado,
ejemplo video hace 4 meses https://www.youtube.com/watch?v=lVLz_ASqAio

SSR lo hicimos por un lado como era sugerido con react, pero nos encargamos en "bajo nivel" de crear nuestro propio "servidor" express, no surgieron problemas
como tener que alimentar a los componentes desde la API de dos formas alternativas ya que en principio el trigger del fetch era el hook useEffect , y de ahi
se llamaba a la API, la cual se cambiaba el estado con esa data ( era practicamente un mirrow de endpoint en el estado) , digamos data del servidor reflejada en el cliente,
Esto mismo no se podia hacer desde los componentes cuando corrian en el servidor ya que no funciona/no tiene sentido el useEffects.
Lo primero que se nos venia a la mente era como desde una especie de componente middleware alimentar con la data ( que ya se sabe de antemano ) el componente iba a usar,
ya que tenemos la clave desde antes del primer render ( referencia tambien surgia el problema del re-render, o que siempre el primero era un estado de esos datos que estan
vacios y se reflejaba como un "loading" .
Como el useEffect no funcionaba en el servidor, para este alimentamos la data en el initialState del componente, reusamos las funciones "fetch" echas en una libreria aparte
qe en vez de usar fetch de la web api ( ya que no existe en node) usamos un fetch isomorphico ( como AXIOS) que funcionaba en la web y en node, para no tener que hacer mas cambios.

Quiero destacar que existia un problema tambien posible de performance, ya que si uno tiene la data en el estado, teniamos que tener en cuenta de no hacer todo el tiempo fetch al servidor
que eso siempre genera un delay en la UI, y nos adentramos al problema de tener una especie de manejo de CACHE en el estado. todo muy engorroso a mi entender.
estas librerias manejan el cache y el stale-while-revalidate

Todos estos problemas llegue a la conclusion de que son algo comun y hay varias maneras de resolverlos. Mas alla del SSR con next.js que ya te arma una capa arriba de react
en la cual el programador se despreocupa de varios de los problemas que nos surgieron ( explicado anteriormente )

ya hi olfateba un problema que no era importante al momento, estos datos podian cambiar en el servidor sin que el cliente se enterara ( vamos a intentar resolver esto)

MAS DE DOS FETCHS ANIDADOS, RELACIONADOS ( SINCRONICOS, MAS EL ESTADO Y CACHE)
Otros problemas que surgian eran cuando una vista tenia que mostrar data de dos api endpoint relacionados, en otras palabras envolvia mas de un fetch, o si estaba cargado ya en el estado
no hacia falta hacer request de esta data, pero ambos estaban relacionados.. ejemplo CATEGORIAS->FAMILIAS BY CATAGORIAS->PRODUCTO.
https://www.youtube.com/watch?v=lVLz_ASqAio

El concepto que se introduce es pensar el estado en dos partes, SERVER STATE y CLIENT STATE.

Otro tema es el routing , con next.js lo resuelve con estrucuctura de directorio, sin tener una configuracion como react routing. en principio me gusta que viendo la estructura
de folders ya uno se va dando cuenta como esta encadenada la app, sin tener que ver la configuracion de un router. No estoy seguro para cosas muy dinamicas y complejas con wildcards
con cantidades de parametros variables si funciona, en principio con parametros wildcards ya vi ejemplos y va bien.

CLIENT STATE

se puede manejar solo con el useState hook de react, pero de nuevo cuando surgen temas como que dos componentes comparten un estado ( sea parent-child o no)
react solo maneja a nivel componente y solo te ofrece pasar el estado x ejemplo en el cado parent-child , al child con una propiedad, y asi
se va enganchando todo para que funcione el render en todos los componentes, o tambien el context para poder pasar esto de una manera.
Para eso aparece Redux que centraliza el problema teniendo un state centralizado para toda la app, pero introduce bastane codigo nuevo para el manejo ( se burocratiza un poco)
Si la funcionalidad no es compleja podriamos arreglarnos con el manejo de estado solo con react o alternativamente utilizar una libreria que sea mas minimalista:
Otra ventaja de Redux era el devtool tab que visualmente podia debugearse muy bien cuando la app crecia en complejidad

JOTAI-ROCOIL ( cuando el estado cambia sin operaciones, no hay machine)
ZUSTAND ( cuando hay logica en el medio para cambiar el estado)
REDUX ( abarca todo, pero es burocratico, lento pogramar, y pesa mucho mas)

XSTATE ( STATE MACHINE, MUY BONITO PERO ACOMPLEJIZA TODO PARA COSAS SIMPLES.. solo sirve para logicas complicadas que se necesiten visualizar mas )

Cuidado you can stop using redux:
https://www.bing.com/videos/search?q=mobx+vs+redux+vs+zustand&&view=detail&mid=881EB9EAB35D3BC15658881EB9EAB35D3BC15658&&FORM=VRDGAR&ru=%2Fvideos%2Fsearch%3Fq%3Dmobx%2Bvs%2Bredux%2Bvs%2Bzustand%26FORM%3DHDRSC4

SERVER STATE
https://www.youtube.com/watch?v=5-1LM2NySR0
https://tkdodo.eu/blog/practical-react-query
Al momento tengo dos opciones que resuelven la problematica API-FETCH-STATE \*\* fetch-state-cache-pagination

Se deja de usar el estado de react cliente ( no redux, no useState nativo) para aquellos datos que vienen o estan en un servidor, y que para cambiarlos hay que hacer un post form request.
Es como que se evita el paso de guardar la data en el state, sino que se le da poder a una libreria para que se encargue de este procedimiento, el resultado
es que si hay un estado unico , pero que no es visible el el state de react o redux, sino que esta en el "servidor" , tiene sentido.

1. react Query ahora tanstack
2. SWR de vercer ( next.js)

CONSULTAS BASE DE DATOS DIRECTAMENTE DESDE REACT

next.js aparecen los server component, y se tiene una manera bastante conveniente de resolver el llamado a un api endpoint en estructura de folders similar al routing

"
I joined a project about 9 months ago, which was deeply into useEffect/Redux hell. The cognitive load to understand what was going on some screens was exhausting. I proposed we use a query manager, and we settled on TansStack. The code we've been writing for new functions is significantly simpler and more "React-y".

It's pretty much essential to be using it or something similar imo. "

USAR REAC QUERY PARA TODO SERVER STATE
PARA APLICACTION (CLIENTE) STATE , IR X REACT NATIVO USESTATE PERO SI SE ACOMPLEJIZA X TEMA DE PASAR ESTADO A COMPONENTES ANIDADOS IR X ZUSTAND O JOTAI , ambas depende cual sea
conveniente.

Deploying next.js
https://nextjs.org/docs/pages/building-your-application/deploying

Volviendo a NEXT.JS VERCEL

convencion de ruteo
https://nextjs.org/docs/app/building-your-application/routing

CLIENT COMPONENTS VS SERVER COMPONENTS
https://dev.to/zenstack/fun-with-nextjs-13-server-components-o37
CLIENT SIDE FETCHING ES LA MANERA COMO LO HACIA YO ANTES
https://nextjs.org/docs/pages/building-your-application/data-fetching/client-side
https://www.youtube.com/watch?v=lJxU3-61F2I
data fetching
https://nextjs.org/docs/app/building-your-application/data-fetching/fetching

SERVER ACTIONS

ailed to compile
./node_modules\@restart\hooks\esm\useCallbackRef.js
ReactServerComponentsError:

You're importing a component that needs useState. It only works in a Client Component but none of its parents are marked with "use client", so they're Server Components by default.

,-[C:\Users\aleco\Documents\Desarrollos\GitHub\nextjs-test\node_modules\@restart\hooks\esm\useCallbackRef.js:1:1]
1 | import { useState } from 'react';
: ^^^^^^^^
2 | /\*_
3 | _ A convenience hook around `useState` designed to be paired with
4 | \* the component [callback ref](https://reactjs.org/docs/refs-and-the-dom.html#callback-refs) api.
`----

Maybe one of these should be marked as a client entry with "use client":
./node_modules\@restart\hooks\esm\useCallbackRef.js
./node_modules\react-bootstrap\cjs\Modal.js
./node_modules\react-bootstrap\cjs\index.js
./src\app\layout.js

CSS
boostrap vs tailwind
https://www.youtube.com/watch?v=lHZwlzOUOZ4

ACLARACIONES
Con next.js server component se puede hacer fetch transparentes desde el server, y se alimenta el component cliente.
si este ultimo necesitas cosas del browser, o javascript , hay que separarlo para que no se renderize en el servidor.
( testear ver bien como lo manda). Ejemplo con boostrap ya me funciona usando "use client" directiva.

Si uno quiere hacer fecth desde el cliente, sin tener que volver o pasar x el STATE, ( useEffects, y problemas mencionados), hay que usar o SWR de next.js , o react query.

Server Components are a separate (but complementary) technology from Server Rendering (SSR). Server Components let you run some of your components purely on the server. SSR, on the other hand, lets you generate HTML before any JavaScript loads. This demo only shows Server Components, and not SSR. Because it doesn't have SSR, the initial page load in this demo has a client-server network waterfall, and will be much slower than any SSR framework. However, Server Components are meant to be integrated together with SSR, and they will be in a future release.

SERVER COMPONENT CACHE FETCH
┌ GET /marcas 200 in 288ms
│
└──── GET https://www.marlew.com.a../api/queries/getBrands.j.. 200 in 3ms (cache: HIT)

- ┌ GET /marcas 200 in 327ms
  │
  └──── GET https://www.marlew.com.a../api/queries/getBrands.j.. 200 in 4ms (cache: HIT)

- wait compiling...
- event compiled client and server successfully in 1894 ms (1133 modules)
- wait compiling...
- event compiled client and server successfully in 5.5s (1133 modules)

- ┌ GET /marcas 200 in 1421ms
  │
  └──── GET https://www.marlew.com.a../api/queries/getBrands.j.. 200 in 941ms (cache: MISS)

MUTATION VS USESTATE VS USEFORM

React Query is a library that provides a way to manage data in React applications. It is used to fetch data from an API and cache it in memory. React Query also provides a way to mutate data on the server using the useMutation hook1.

The useMutation hook returns an array with two elements: the first element is a function that you can call to mutate the data on the server, and the second element is an object that contains information about the mutation, such as whether it is currently loading1.

React Query mutations allow you to avoid using the useState or useForm hook to keep a form render with their values2. Instead, you can use the useMutation hook to mutate data on the server and update your form accordingly1.

I hope this helps! Let me know if you have any other questions.

FORM DATA

`FormData` is a built-in JavaScript object that provides a convenient way to construct and manipulate data in HTML forms. It allows you to create a set of key-value pairs representing form fields and their values.

The `FormData` object can be used to capture data entered in HTML form elements, such as `<input>`, `<textarea>`, and `<select>`. It provides methods to append, retrieve, and manipulate form data before sending it to a server.

`FormData` is supported in modern browsers and is part of the Fetch API, which is used for making HTTP requests in JavaScript.

Here's an example of how to use `FormData`:

```javascript
const form = document.querySelector('form');
const formData = new FormData(form);

formData.append('additionalField', 'additionalValue');

// Iterate over form data
for (const entry of formData.entries()) {
  const [name, value] = entry;
  console.log(`${name}: ${value}`);
}
```

In this example, we create a new `FormData` object by passing a reference to an HTML form element (`form`) as an argument. We can then use various methods, such as `append()`, to add additional fields to the form data. The `entries()` method allows us to iterate over the form data and access each key-value pair.

`FormData` is commonly used when sending form data via AJAX requests or when constructing multipart/form-data requests for file uploads. It provides a convenient way to gather form data and prepare it for sending to a server.

Note that `FormData` is different from JSON. While JSON represents data as a string, `FormData` is specifically designed for handling form data and supports files, binary data, and multiple values for the same field name.

VALIDATION

Joi, Yup, and AJV (Another JSON Schema Validator) are all popular libraries used for validating and enforcing schema constraints in JavaScript applications. While they serve a similar purpose, there are some differences in their features and usage. Here's a brief comparison of these libraries:

Joi:

Joi is a powerful schema description language and data validator for JavaScript.
It allows you to define complex validation rules using a fluent API and supports a wide range of validation types, including string, number, date, boolean, object, array, and more.
Joi provides a rich set of built-in validation methods and allows for custom validation rules.
It offers features like conditional validation, schema composition, error messages customization, and more.
Joi is widely used and has a strong ecosystem of plugins and integrations.
It can be used both on the client-side and server-side (Node.js).
Yup:

Yup is a schema validation library that focuses on simplicity and ease of use.
It provides a simple API for defining schemas and validating data against those schemas.
Yup supports basic validation types such as string, number, boolean, array, object, and date, and offers various validation methods for each type.
It supports asynchronous validation and conditional validation.
Yup allows for custom validation functions and error messages customization.
It is widely used in React and React Native applications, but can also be used in Node.js.
AJV:

AJV is a fast and efficient JSON Schema validator for JavaScript.
It fully supports the JSON Schema standard and provides a complete implementation of the specification.
AJV offers powerful validation capabilities, including data validation, data coercion, and data normalization.
It focuses on speed and provides excellent performance.
AJV is particularly popular in the Node.js ecosystem.
It supports asynchronous validation, custom keywords, and error messages customization.
AJV has a large user community and supports various JSON Schema draft versions.
Choosing the right library depends on your specific requirements and preferences. If you need advanced features, extensive validation options, and a rich ecosystem, Joi might be a good choice. If simplicity and ease of use are your primary concerns, Yup provides a straightforward API. If you want full compliance with the JSON Schema standard and excellent performance, AJV is a solid option. Consider the features, documentation, community support, and ecosystem of each library to determine which one best fits your project.

EJEMPLO VALIDATION

import { useForm } from 'react-hook-form';
import \* as yup from 'yup';

const schema = yup.object().shape({
name: yup.string().required('Name is required'),
email: yup.string().email('Invalid email').required('Email is required'),
});

const YourComponent = () => {
const { register, handleSubmit, formState: { errors } } = useForm({
resolver: yupResolver(schema),
});

const onSubmit = (data) => {
// Handle form submission
console.log(data);
};

return (

<form onSubmit={handleSubmit(onSubmit)}>
{/_ Form inputs _/}
<input type="text" {...register('name')} placeholder="Name" />
{errors.name && <p>{errors.name.message}</p>}

      <input type="email" {...register('email')} placeholder="Email" />
      {errors.email && <p>{errors.email.message}</p>}

      {/* Submit button */}
      <button type="submit">Submit</button>
    </form>

);
};

ZACT ( validacion de server action en NEXT.js)

WEBPACK REEMPLACMENT

VITE.JS ( HMR , ESM modules in DEV , muy general podes hacer un proyecto en vanilla js, vue, react.. me gusta
para backends)

ASTRO / GATSBY SSG( usas todas las ventajas de react modules pero te genera un STATIC SITE , HTML , SIN SSR PERO YA TE DA EL HTML , rapido para web) ASTRO ES EL MAS SIMPLE SEGUN LOS YOUTUBERS

NEXT.JS SSR-SSG LARGE SCALE APPLICATION ( HACE TODO pero muy configurable , todo al mismo tiempo, partes SSR, otras partes ) ademas tiene todas las ventajas de facil ruteo, facil API , server functions, server components.

REMIX FULL-STACK( mete la capa de base de datos tambien) , ejemplo con next.js tenes que hacerte cargo
de la capa de base de datos x ejemplo con prisma

SHARED COMPONENTS ( PUEDEN FUNCIONAR EN EL SERVER O EL CLIENTE)

NUEVOS HOOKS MUY UTILES

useForm, useTransition, useOptimistic
controller component
Components defaults para server components
<Suspense> lets you display a fallback until its children have finished loading.

<Suspense fallback={<Loading />}>
<SomeComponent />
</Suspense>
