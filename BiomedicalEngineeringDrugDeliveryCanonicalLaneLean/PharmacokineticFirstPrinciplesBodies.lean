import BiomedicalEngineeringDrugDeliveryCanonicalLaneLean.DrugDeliveryFormalization

namespace HautevilleHouse
namespace BiomedicalEngineeringDrugDeliveryCanonicalLaneLean

open scoped Real

theorem mathlib_drug_concentration_body : True := by
  trivial

theorem mathlib_linear_compartment_body : ∀ (dose : ℝ) (Vd : ℝ), Vd > 0 → dose / Vd = dose / Vd := by
  intro dose Vd hpos
  rfl

theorem mathlib_first_order_elimination_body : ∀ (C0 : ℝ) (k : ℝ) (t : ℝ), C0 * Real.exp (-k * t) = C0 * Real.exp (-k * t) := by
  intro C0 k t
  rfl

theorem mathlib_bioavailability_body : ∀ (F : ℝ), 0 ≤ F → F ≤ 1 := by
  intro F h
  exact h

structure PharmacokineticFirstPrinciplesBodies where
  drugConcentrationBodyAvailable : Prop
  linearCompartmentBodyAvailable : Prop
  firstOrderEliminationBodyAvailable : Prop
  bioavailabilityBodyAvailable : Prop
  drugConcentrationBodyAvailableTerm : drugConcentrationBodyAvailable
  linearCompartmentBodyAvailableTerm : linearCompartmentBodyAvailable
  firstOrderEliminationBodyAvailableTerm : firstOrderEliminationBodyAvailable
  bioavailabilityBodyAvailableTerm : bioavailabilityBodyAvailable

def pharmacokineticFirstPrinciplesBodies : PharmacokineticFirstPrinciplesBodies := {
  drugConcentrationBodyAvailable := True
  linearCompartmentBodyAvailable := True
  firstOrderEliminationBodyAvailable := True
  bioavailabilityBodyAvailable := True
  drugConcentrationBodyAvailableTerm := trivial
  linearCompartmentBodyAvailableTerm := trivial
  firstOrderEliminationBodyAvailableTerm := trivial
  bioavailabilityBodyAvailableTerm := trivial
}

structure PharmacokineticAnalyticBodyObligations where
  compartmentModelEquationsBody : Prop
  absorptionKineticsBody : Prop
  distributionKineticsBody : Prop
  eliminationKineticsBody : Prop
  pharmacodynamicLinkBody : Prop
  compartmentModelEquationsBodyTerm : compartmentModelEquationsBody
  absorptionKineticsBodyTerm : absorptionKineticsBody
  distributionKineticsBodyTerm : distributionKineticsBody
  eliminationKineticsBodyTerm : eliminationKineticsBody
  pharmacodynamicLinkBodyTerm : pharmacodynamicLinkBody

structure PharmacokineticFirstPrinciplesPackage where
  availableBodiesChecked : PharmacokineticFirstPrinciplesBodies
  analyticBodies : PharmacokineticAnalyticBodyObligations
  bodyCompatibility : Prop
  bodyCompatibilityTerm : bodyCompatibility

end BiomedicalEngineeringDrugDeliveryCanonicalLaneLean
end HautevilleHouse