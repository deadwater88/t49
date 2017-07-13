import React from 'react';


const Container = (props) =>{
  let {size, container_type, container_id} = props.container;
  let containerDisplay = [
    {label: 'Number', value: container_id},
    {label: 'Size', value: size},
    {label: 'Type', value: container_type}
  ];
  return(
    <div>
      Container Information:
      {containerDisplay.map((display, idx)=> {
        return (
        <div className='display' key={idx + 'containerDisplay'}>
          <label >
            {display.label + ':'}
          </label>
          <p> {display.value} </p>
        </div>
      );
      })}
    </div>
  );
};

export default Container
